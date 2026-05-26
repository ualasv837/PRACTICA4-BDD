from pydantic import BaseModel, field_validator
from typing import Optional
from datetime import datetime


# ── Libro (Book) ─────────────────────────────────────────────────────────────

class BookCreate(BaseModel):
    titulo: str
    autor: str
    editorial: str
    publicadoEn: Optional[int] = None
    categoria: Optional[str] = None


class BookResponse(BookCreate):
    id: int


# ── Ejemplar (Copy) ───────────────────────────────────────────────────────────

class CopyCreate(BaseModel):
    numeroInventario: str
    estado: Optional[str] = None
    idLibro: Optional[int] = None


class CopyResponse(CopyCreate):
    pass


# ── Usuario (User) ────────────────────────────────────────────────────────────

class UserCreate(BaseModel):
    nombre: str
    apellidos: str
    email: str
    telefono: Optional[str] = None
    tipoUsuario: Optional[str] = None


class UserResponse(UserCreate):
    id: int
    sancionadoHasta: Optional[datetime] = None


# ── Préstamo (Loan) ───────────────────────────────────────────────────────────

class LoanCreate(BaseModel):
    numeroInventario: str
    idUsuario: int


class ReturnBook(BaseModel):
    numeroInventario: str
    idUsuario: int


class LoanResponse(BaseModel):
    id: int
    numeroInventario: str
    idUsuario: int
    fechaPrestamo: Optional[datetime] = None
    fechaLimite: Optional[datetime] = None
    fechaDevolucion: Optional[datetime] = None


# ── Historial de préstamos (Loan History) ─────────────────────────────────────

class LoanHistoryResponse(BaseModel):
    id: int
    numeroInventario: str
    idUsuario: int
    fechaPrestamo: Optional[datetime] = None
    fechaDevolucion: Optional[datetime] = None


# ── Reseña (Review) ───────────────────────────────────────────────────────────

class ReviewCreate(BaseModel):
    idUsuario: int
    idLibro: int
    valoracion: int
    opinion: Optional[str] = None

    @field_validator('valoracion')
    @classmethod
    def rating_range(cls, v: int) -> int:
        if not (1 <= v <= 5):
            raise ValueError('valoracion must be between 1 and 5')
        return v


class ReviewResponse(ReviewCreate):
    pass


# ── Reserva (Reservation) ─────────────────────────────────────────────────────

class ReservationCreate(BaseModel):
    idUsuario: int
    idLibro: int


class ReservationResponse(ReservationCreate):
    fechaReserva: Optional[datetime] = None
