from typing import Generator

from lib.database.connection import SessionLocal


def get_db() -> Generator:
    with SessionLocal() as session:
        yield session
