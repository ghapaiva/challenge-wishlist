from fastapi import APIRouter

from lib.routes.customers import router as customers_router
from lib.routes.products import router as products_router

router = APIRouter(prefix="")


router.include_router(customers_router)
router.include_router(products_router)
