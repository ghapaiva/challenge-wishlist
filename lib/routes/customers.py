import uuid
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List, Optional

from lib.database.session import get_db
from lib.entities.customer.repository import CRUDCustomer
from lib.entities.customer.schema import CustomerBase, CustomerCreateBase, CustomerResponseBase
from lib.entities.customer_wishlist.repository import CRUDCustomerWishlist
from lib.entities.customer_wishlist.schema import CustomerWishlistBase, CustomerWishlistCreateBase, CustomerWishlistResponseBase
from lib.middlewares.AuthMiddleware import AuthMiddleware
from lib.service.partner.products.repository import PartnerProductService
from lib.service.partner.products.schema import ProductBase

router = APIRouter(tags=["Customer"], prefix="/customers")


@router.get("", response_model=List[CustomerResponseBase])
def show_customers(
    db: Session = Depends(get_db),
    _=Depends(AuthMiddleware())
):
    return CRUDCustomer().get_all(db=db)


@router.get("/{id}", response_model=Optional[CustomerResponseBase])
def show_customer(
    id: uuid.UUID,
    db: Session = Depends(get_db),
    _=Depends(AuthMiddleware())
):
    return CRUDCustomer().get(db=db, id=id)


@router.post("", response_model=CustomerResponseBase)
def create_customer(
    payload: CustomerCreateBase,
    db: Session = Depends(get_db),
    _=Depends(AuthMiddleware())
):
    if CRUDCustomer().get_by_email(db=db, email=payload.email):
        raise HTTPException(409, f"This e-mail is already in database.")

    return CRUDCustomer().create(db=db, payload=payload)


@router.put("/{id}", response_model=CustomerResponseBase)
def update_customer(
    id: uuid.UUID,
    payload: CustomerCreateBase,
    db: Session = Depends(get_db),
    _=Depends(AuthMiddleware())
):
    crud_customer: CRUDCustomer = CRUDCustomer()
    if not crud_customer.get(db=db, id=id):
        raise HTTPException(404, "Customer not found.")
    aux_customer: CustomerBase = crud_customer.get_by_email(db=db, email=payload.email)
    if aux_customer and aux_customer.id != id:
        raise HTTPException(409, f"This e-mail is already in database.")

    return crud_customer.update(db=db, id=id, payload=payload)


@router.delete("/{id}", response_model=CustomerResponseBase)
def remove_customer(
    id: uuid.UUID,
    db: Session = Depends(get_db),
    _=Depends(AuthMiddleware())
):
    crud_customer: CRUDCustomer = CRUDCustomer()
    if not crud_customer.get(db=db, id=id):
        raise HTTPException(404, "Customer not found.")

    return crud_customer.remove(db=db, id=id)


@router.get("/{id}/wishlist", response_model=List[ProductBase])
def get_customer_wishlist(
    id: uuid.UUID,
    db: Session = Depends(get_db),
    _=Depends(AuthMiddleware())
):
    crud_customer: CRUDCustomer = CRUDCustomer()
    crud_customer_wishlist: CRUDCustomerWishlist = CRUDCustomerWishlist()
    if not crud_customer.get(db=db, id=id):
        raise HTTPException(404, "Customer not found.")

    wishlist = []
    customer_wishlists: List[CustomerWishlistBase] = crud_customer_wishlist.get_by_customer(
        db=db,
        customer_id=id
    )
    for row in customer_wishlists:
        product: ProductBase = PartnerProductService().get(row.product_id)
        if product:
            wishlist.append(product)
    return wishlist


@router.post("/{id}/wishlist/{product_id}", response_model=CustomerWishlistResponseBase)
def create_customer_wishlist(
    id: uuid.UUID,
    product_id: uuid.UUID,
    db: Session = Depends(get_db),
    _=Depends(AuthMiddleware())
):
    crud_customer: CRUDCustomer = CRUDCustomer()
    crud_customer_wishlist: CRUDCustomerWishlist = CRUDCustomerWishlist()
    if not crud_customer.get(db=db, id=id):
        raise HTTPException(404, "Customer not found.")
    product: ProductBase = PartnerProductService().get(product_id)
    if not product:
        raise HTTPException(404, "Product not found.")
    if crud_customer_wishlist.get_by_customer_and_product(
        db=db,
        customer_id=id,
        product_id=product_id
    ):
        raise HTTPException(409, "This product is already on the customer's wishlist.")

    customer_wishlist: CustomerWishlistResponseBase = crud_customer_wishlist.create(db=db, payload=CustomerWishlistCreateBase(
        customer_id=id,
        product_id=product_id
    ))
    customer_wishlist.product = product
    return customer_wishlist


@router.delete("/{id}/wishlist/{product_id}", response_model=CustomerWishlistResponseBase)
def remove_customer_wishlist(
    id: uuid.UUID,
    product_id: uuid.UUID,
    db: Session = Depends(get_db),
    _=Depends(AuthMiddleware())
):
    crud_customer: CRUDCustomer = CRUDCustomer()
    crud_customer_wishlist: CRUDCustomerWishlist = CRUDCustomerWishlist()
    if not crud_customer.get(db=db, id=id):
        raise HTTPException(404, "Customer not found.")
    product: ProductBase = PartnerProductService().get(product_id)
    if not product:
        raise HTTPException(404, "Product not found.")
    if not crud_customer_wishlist.get_by_customer_and_product(
        db=db,
        customer_id=id,
        product_id=product_id
    ):
        raise HTTPException(409, "The product was not found on this customer wishlist.")

    customer_wishlist: CustomerWishlistResponseBase = crud_customer_wishlist.get_by_customer_and_product(
        db=db,
        customer_id=id,
        product_id=product_id
    )
    return crud_customer_wishlist.remove(db=db, id=customer_wishlist.id)
