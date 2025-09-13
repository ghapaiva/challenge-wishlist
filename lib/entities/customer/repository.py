import uuid
from fastapi import HTTPException
from sqlalchemy.orm import Session
from typing import List, Optional

from lib.entities.customer.model import Customer
from lib.entities.customer.schema import CustomerBase, CustomerCreateBase


class CRUDCustomer():
    """
    This class contains the methods that returns data from database
    In a complete development, it would be good for this class to have an inheritance
    """

    def get_all(self, db: Session) -> List[CustomerBase]:
        """
        Method that retrieves all the customers in database
        Args:
            The database session (db: Session)
        Returns:
            A list of customers (List[CustomerBase])
        """
        return db.query(Customer).order_by(Customer.name).all()

    def get(self, db: Session, id: uuid.UUID) -> Optional[CustomerBase]:
        """
        Method that retrieves one customer based on the id
        Args:
            The database session (db: Session)
            The customer id (id: uuid.UUID
        Returns:
            An optional customer schema (Optional[CustomerBase]]
        """
        return db.query(Customer).filter(Customer.id == id).first()

    def get_by_email(self, db: Session, email: str) -> Optional[CustomerBase]:
        """
        Method that retrieves the customer based on e-mail
        Args:
            The database session (db: Session)
            The e-mail that will be search (email: str)
        Returns:
            An optional customer schema (Optional[CustomerBase]]
        """
        return db.query(Customer).filter(Customer.email == email).first()

    def create(self, db: Session, payload: CustomerCreateBase) -> CustomerBase:
        """
        Method that a new customer
        Args:
            The database session (db: Session)
            The payload used to create the new user (payload: CustomerCreateBase)
        Returns:
            An customer schema (CustomerBase)
        """
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
        """
        Method that a updates customer
        Args:
            The database session (db: Session)
            The payload used to update the user (payload: CustomerCreateBase)
        Returns:
            An customer schema (CustomerBase)
        """
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
        """
        Method that a remove a customer from database
        Args:
            The database session (db: Session)
            The customer id (id: uuid.UUID
        Returns:
            An customer schema (CustomerBase)
        """
        try:
            db_customer: Customer = self.get(db=db, id=id)
            db.delete(db_customer)
            db.flush()
        except HTTPException as e:
            raise e
        finally:
            db.commit()
        return db_customer
