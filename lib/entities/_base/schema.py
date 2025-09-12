import uuid
from datetime import datetime
from pydantic import BaseModel
from pydantic.alias_generators import to_camel, to_snake
from typing import Optional


class RequestBase(BaseModel):
    """Base model for request schemas.
    - Converts body to snake_case.
    """
    class Config:
        alias_generator = to_snake
        populate_by_name = True
        from_attributes = True
        protected_namespaces = ()


class ResponseBase(BaseModel):
    """Base model for response schemas.
    - Converts body to camelCase.
    """
    class Config:
        alias_generator = to_camel
        populate_by_name = True
        from_attributes = True
        protected_namespaces = ()
        orm_mode = True


class ModelBase(BaseModel):
    id: uuid.UUID
    created_at: datetime
    updated_at: datetime
