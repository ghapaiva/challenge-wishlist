import uuid
from pydantic import BaseModel


class ProductBase(BaseModel):
    id: uuid.UUID
    title: str
    image: str
    price: float
