import uuid
from datetime import datetime
from pydantic import BaseModel
from typing import Optional

from lib.entities._base.schema import (
    ModelBase,
    ResponseBase,
)
from lib.service.partner.products.schema import ProductBase


class CustomerWishlistBase(ModelBase):
    id: Optional[uuid.UUID] = None
    customer_id: uuid.UUID
    product_id: uuid.UUID
    created_at: datetime
    updated_at: datetime


class CustomerWishlistCreateBase(BaseModel):
    customer_id: uuid.UUID
    product_id: uuid.UUID


class CustomerWishlistResponseBase(ResponseBase, CustomerWishlistBase):
    product: Optional[ProductBase] = None
