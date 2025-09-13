import uuid
from fastapi import HTTPException
from sqlalchemy.orm import Session
from typing import List, Optional

from lib.entities.customer.model import Customer
from lib.entities.customer.schema import CustomerBase, CustomerCreateBase


class CRUDCustomer():
    def get_all(self, db: Session) -> List[CustomerBase]:
        return db.query(Customer).order_by(Customer.name).all()

    def get(self, db: Session, id: uuid.UUID) -> Optional[CustomerBase]:
        return db.query(Customer).filter(Customer.id == id).first()

    def get_by_email(self, db: Session, email: str) -> Optional[CustomerBase]:
        return db.query(Customer).filter(Customer.email == email).first()

    def create(self, db: Session, payload: CustomerCreateBase) -> CustomerBase:
        try:
            db_customer: Customer = Customer(**payload.model_dump())
            db.add(db_customer)
            db.flush()
        except HTTPException as e:
            raise e
        finally:
            db.commit()
        return db_customer

    def update(self, db: Session, id: uuid.UUID, payload: CustomerCreateBase) -> CustomerBase:
        try:
            db_customer: Customer = self.get(db=db, id=id)
            db_customer.name = payload.name
            db_customer.email = payload.email
            db.add(db_customer)
            db.flush()
        except HTTPException as e:
            raise e
        finally:
            db.commit()
        return db_customer

    def remove(self, db: Session, id: uuid.UUID) -> CustomerBase:
        try:
            db_customer: Customer = self.get(db=db, id=id)
            db.delete(db_customer)
            db.flush()
        except HTTPException as e:
            raise e
        finally:
            db.commit()
        return db_customer
