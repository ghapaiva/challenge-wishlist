from fastapi import Depends
from typing import Generator

from lib.database.connection import SessionLocal
from lib.entities.auth.schema import AuthBase
from lib.middleware.Auth import Auth


def get_db(auth: AuthBase = Depends(Auth())) -> Generator:
    with SessionLocal() as session:
        yield session
