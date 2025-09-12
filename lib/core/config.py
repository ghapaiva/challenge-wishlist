from pydantic import validator
from pydantic_settings import BaseSettings
from sqlalchemy.engine import URL
from typing import Any, Dict, Optional


class Settings(BaseSettings):
    ENV: str
    DEBUG: Optional[bool] = False

    DATABASE_HOST: str
    DATABASE_PORT: int
    DATABASE_DIALECT: str
    DATABASE_NAME: str
    DATABASE_USER: str
    DATABASE_PASSWORD: str = ""

    KEYCLOAK_BASE_URL: str
    KEYCLOAK_REALM: str
    KEYCLOAK_CLIENT_ID: str
    KEYCLOAK_CLIENT_SECRET: str = ""
    KEYCLOAK_ROLES_MANAGE: Optional[bool] = False

    INSTANCE_APP_CONFIG: Optional[dict] = None

    @validator("INSTANCE_APP_CONFIG", pre=True)
    def assemble_swagger_oauth2(cls, v: Optional[str], values: Dict[str, Any]) -> Any:
        if values.get("TESTING"):
            return {
                "title": "Wishlist API",
                "swagger_ui_init_oauth": {
                    "clientId": values.get("KEYCLOAK_CLIENT_ID"),
                    "clientSecret": values.get("KEYCLOAK_CLIENT_SECRET"),
                },
            }
        return {
            "title": "Wishlist API",
            "root_path": values.get("PATH_PREFIX"),
        }

    DATABASE_ORM_MAX_OVERFLOW: int = 10
    DATABASE_ORM_POOL_SIZE: int = 20
    DATABASE_ORM_POOL_PRE_PING: bool = True
    DATABASE_ORM_POOL_RECYCLE: int = 1800
    DATABASE_ORM_POOL_TIMEOUT: int = 10
    DATABASE_URL: Optional[URL] = None


Settings.model_rebuild()
settings = Settings()
settings.DATABASE_URL = URL.create(
    "postgresql",
    username=settings.DATABASE_USER,
    password=settings.DATABASE_PASSWORD,
    host=settings.DATABASE_HOST,
    port=settings.DATABASE_PORT,
    database=settings.DATABASE_NAME,
)
