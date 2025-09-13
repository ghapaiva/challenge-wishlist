from fastapi import APIRouter, Depends
from typing import List

from lib.middlewares.AuthMiddleware import AuthMiddleware
from lib.service.partner.products.repository import PartnerProductService
from lib.service.partner.products.schema import ProductBase

router = APIRouter(tags=["Product"], prefix="/products")


@router.get("", response_model=List[ProductBase])
def show_products(
    _=Depends(AuthMiddleware())
):
    return PartnerProductService().get_all()
