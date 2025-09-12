import pyodbc
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from lib.core.config import settings


pyodbc.pooling = False

engine = create_engine(
    settings.DATABASE_URL,
    echo=settings.DEBUG,
    pool_size=settings.DATABASE_ORM_POOL_SIZE,
    max_overflow=settings.DATABASE_ORM_MAX_OVERFLOW,
    pool_pre_ping=settings.DATABASE_ORM_POOL_PRE_PING,
    pool_recycle=settings.DATABASE_ORM_POOL_RECYCLE,
    pool_timeout=settings.DATABASE_ORM_POOL_TIMEOUT
)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
