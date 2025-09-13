import uuid
from pydantic import BaseModel
from typing import List, Optional


class UserBase(BaseModel):
    id: uuid.UUID
    first_name: str
    last_name: Optional[str]
    username: str
    email: str

    roles: List[str]
