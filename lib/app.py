from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from lib.core.config import settings
from lib.routes.router import api_router
from lib.utils.log import setup as setup_logger


setup_logger()


def create_app():
    _app = FastAPI(**settings.INSTANCE_APP_CONFIG)

    _app.add_middleware(
        CORSMiddleware,
        allow_origins=["*"],
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )
    _app.include_router(api_router)

    return _app
