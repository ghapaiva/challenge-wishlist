from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from typing import List

from lib.database.session import get_db
from lib.entities.customer.model import Customer
from lib.entities.customer.schema import CustomerResponseBase

router = APIRouter(tags=["Customer"], prefix="/customers")


@router.get("", response_model=List[CustomerResponseBase])
def show_customers(
    db: Session = Depends(get_db)
):
    customers = db.query(Customer).all()
    return customers
