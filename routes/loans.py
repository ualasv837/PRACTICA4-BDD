import logging
from datetime import datetime, timedelta
from fastapi import APIRouter, Depends, HTTPException, status
from mysql.connector import Error as MySQLError
from mysql.connector.abstracts import MySQLConnectionAbstract
from database import get_db
from models import LoanCreate, ReturnBook

router = APIRouter()
logger = logging.getLogger("uvicorn")


# =============================================================================
# POST /loans  — Registra un nuevo préstamo (llama a RealizarPrestamo)
# =============================================================================
@router.post("/", status_code=status.HTTP_201_CREATED)
async def create_loan(loan: LoanCreate, conn: MySQLConnectionAbstract = Depends(get_db)):
    logger.info("POST /loans - user=%d, ejemplar=%s", loan.idUsuario, loan.numeroInventario)
    cursor = conn.cursor()
    fecha_limite = datetime.now() + timedelta(days=15)
    try:
        cursor.callproc("RealizarPrestamo", (loan.idUsuario, loan.numeroInventario, fecha_limite))
        conn.commit()
    except MySQLError as e:
        conn.rollback()
        logger.warning("POST /loans - %s", e.msg)
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.msg)

    return {"detail": "Loan created successfully"}


# =============================================================================
# POST /loans/return  — Registra la devolución de un libro (llama a DevolverLibro)
# =============================================================================
@router.post("/return", status_code=status.HTTP_201_CREATED)
async def return_book(data: ReturnBook, conn: MySQLConnectionAbstract = Depends(get_db)):
    logger.info("POST /loans/return - user=%d, ejemplar=%s", data.idUsuario, data.numeroInventario)
    cursor = conn.cursor()
    try:
        cursor.callproc("DevolverLibro", (data.idUsuario, data.numeroInventario))
        conn.commit()
    except MySQLError as e:
        conn.rollback()
        logger.warning("POST /loans/return - %s", e.msg)
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.msg)

    return {"detail": "Book returned successfully"}
