import uuid
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List, Optional

from lib.database.session import get_db
from lib.entities.customer.repository import CRUDCustomer
from lib.entities.customer.schema import CustomerBase, CustomerCreateBase, CustomerResponseBase
from lib.service.partner.products.repository import get_all

router = APIRouter(tags=["Customer"], prefix="/customers")


@router.get("", response_model=List[CustomerResponseBase])
def show_customers(
    db: Session = Depends(get_db)
):
    return CRUDCustomer().get_all(db=db)


@router.get("/{id}", response_model=Optional[CustomerResponseBase])
def show_customer(
    id: uuid.UUID,
    db: Session = Depends(get_db),
):
    return CRUDCustomer().get(db=db, id=id)


@router.post("", response_model=CustomerResponseBase)
def create_customer(
    payload: CustomerCreateBase,
    db: Session = Depends(get_db),
):
    if CRUDCustomer().get_by_email(db=db, email=payload.email):
        raise HTTPException(409, f"This e-mail is already in database.")

    return CRUDCustomer().create(db=db, payload=payload)


@router.put("/{id}", response_model=CustomerResponseBase)
def update_customer(
    id: uuid.UUID,
    payload: CustomerCreateBase,
    db: Session = Depends(get_db),
):
    if not CRUDCustomer().get(db=db, id=id):
        raise HTTPException(404, "Customer not found.")
    aux_customer: CustomerBase = CRUDCustomer().get_by_email(db=db, email=payload.email)
    if aux_customer and aux_customer.id != id:
        raise HTTPException(409, f"This e-mail is already in database.")

    return CRUDCustomer().update(db=db, id=id, payload=payload)


@router.delete("/{id}", response_model=CustomerResponseBase)
def update_customer(
    id: uuid.UUID,
    db: Session = Depends(get_db),
):
    if not CRUDCustomer().get(db=db, id=id):
        raise HTTPException(404, "Customer not found.")

    return CRUDCustomer().remove(db=db, id=id)
