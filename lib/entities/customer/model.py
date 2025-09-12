from sqlalchemy import Column, VARCHAR

from lib.entities._base.model import Base


class Customer(Base):
    __tablename__ = "customers"

    name = Column(VARCHAR(55), nullable=False, comment="Customer's name")
    email = Column(VARCHAR(55), nullable=False, comment="Customer's e-mail")
