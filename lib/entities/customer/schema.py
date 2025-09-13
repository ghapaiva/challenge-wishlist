import uuid
from datetime import datetime
from pydantic import BaseModel, Field
from typing import Optional

from lib.entities._base.schema import (
    ModelBase,
    ResponseBase,
)


class CustomerBase(ModelBase):
    id: Optional[uuid.UUID] = None
    name: str = Field(min_length=1, max_length=55)
    email: Optional[str] = Field(default=None, min_length=1, max_length=55)
    created_at: datetime
    updated_at: datetime


class CustomerCreateBase(BaseModel):
    name: str = Field(min_length=1, max_length=55)
    email: str = Field(min_length=1, max_length=55)


class CustomerResponseBase(ResponseBase, CustomerBase):
    pass
