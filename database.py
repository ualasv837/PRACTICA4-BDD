import mysql.connector
from mysql.connector import pooling
import os
from dotenv import load_dotenv

load_dotenv()

# Los datos de acceso estan definidos en el fichero .env
_DB_HOST = os.environ.get('MYSQL_HOST', 'mysql')
_DB_PORT = int(os.getenv("MYSQL_PORT", 3306))
_DB_USER = os.environ.get('MYSQL_USER')
_DB_PASSWORD = os.environ.get('MYSQL_PASSWORD')
_DB_NAME = os.environ.get('MYSQL_DATABASE', 'mydatabase')


_pool = pooling.MySQLConnectionPool(
    pool_name="main_pool",
    pool_size=5,
    host=_DB_HOST,
    port=_DB_PORT,
    user=_DB_USER,
    password=_DB_PASSWORD,
    database=_DB_NAME,
    charset='utf8mb4'
)

def get_connection():
    return _pool.get_connection()

def get_db():
    conn = _pool.get_connection()
    try:
        yield conn
    finally:
        conn.close()
