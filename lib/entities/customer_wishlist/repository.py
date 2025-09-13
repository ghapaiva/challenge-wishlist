import uuid
from fastapi import HTTPException
from sqlalchemy.orm import Session
from typing import List, Optional

from lib.entities.customer_wishlist.model import CustomerWishlist
from lib.entities.customer_wishlist.schema import CustomerWishlistBase, CustomerWishlistCreateBase


class CRUDCustomerWishlist():
    """
    This class contains the methods that returns data from database
    In a complete development, it would be good for this class to have an inheritance
    """

    def get_all(self, db: Session) -> List[CustomerWishlistBase]:
        """
        Method that retrieves all the customer wishlists in database
        Args:
            The database session (db: Session)
        Returns:
            A list of customer wishlists (List[CustomerWishlistBase])
        """
        return db.query(CustomerWishlist).order_by(CustomerWishlist.name).all()

    def get(self, db: Session, id: uuid.UUID) -> Optional[CustomerWishlistBase]:
        """
        Method that retrieves one customer wishlist based on the id
        Args:
            The database session (db: Session)
            The customer wishlist id (id: uuid.UUID
        Returns:
            An optional customer wishlist schema (Optional[CustomerWishlistBase]]
        """
        return db.query(CustomerWishlist).filter(CustomerWishlist.id == id).first()

    def get_by_customer(self, db: Session, customer_id: uuid.UUID) -> List[CustomerWishlistBase]:
        """
        Method that retrieves the wishlist by the customer
        Args:
            The database session (db: Session)
            The customer id (customer_id: uuid.UUID)
        Returns:
            A list of wishlist (List[CustomerWishlistBase]]
        """
        return db.query(CustomerWishlist).filter(CustomerWishlist.customer_id == customer_id).all()

    def get_by_customer_and_product(self, db: Session, customer_id: uuid.UUID, product_id: uuid.UUID) -> Optional[CustomerWishlistBase]:
        """
        Method that retrieves the wishlist by the customer and product
        Args:
            The database session (db: Session)
            The customer id (customer_id: uuid.UUID)
            The product id (product_id: uuid.UUID)
        Returns:
            An optional wishlist (Optional[CustomerWishlistBase])
        """
        return db.query(CustomerWishlist) \
            .filter(CustomerWishlist.customer_id == customer_id) \
            .filter(CustomerWishlist.product_id == product_id) \
            .first()

    def create(self, db: Session, payload: CustomerWishlistCreateBase) -> CustomerWishlistBase:
        """
        Method that a new customer wishlist
        Args:
            The database session (db: Session)
            The payload used to create the new user (payload: CustomerWishlistCreateBase)
        Returns:
            An customer wishlist schema (CustomerWishlistBase)
        """
        try:
            db_customer_wishlist: CustomerWishlist = CustomerWishlist(**payload.model_dump())
            db.add(db_customer_wishlist)
            db.flush()
        except HTTPException as e:
            raise e
        finally:
            db.commit()
        return db_customer_wishlist

    def update(self, db: Session, id: uuid.UUID, payload: CustomerWishlistCreateBase) -> CustomerWishlistBase:
        """
        Method that a updates customer wishlist
        Args:
            The database session (db: Session)
            The payload used to update the user (payload: CustomerWishlistCreateBase)
        Returns:
            An customer wishlist schema (CustomerWishlistBase)
        """
        try:
            db_customer_wishlist: CustomerWishlist = self.get(db=db, id=id)
            db_customer_wishlist.name = payload.name
            db_customer_wishlist.email = payload.email
            db.add(db_customer_wishlist)
            db.flush()
        except HTTPException as e:
            raise e
        finally:
            db.commit()
        return db_customer_wishlist

    def remove(self, db: Session, id: uuid.UUID) -> CustomerWishlistBase:
        """
        Method that a remove a customer wishlist from database
        Args:
            The database session (db: Session)
            The customer wishlist id (id: uuid.UUID
        Returns:
            An customer wishlist schema (CustomerWishlistBase)
        """
        try:
            db_customer_wishlist: CustomerWishlist = self.get(db=db, id=id)
            db.delete(db_customer_wishlist)
            db.flush()
        except HTTPException as e:
            raise e
        finally:
            db.commit()
        return db_customer_wishlist
