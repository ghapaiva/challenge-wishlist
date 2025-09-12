from fastapi import APIRouter

from lib.routes.customers import router as customers_router

router = APIRouter(prefix="")


router.include_router(customers_router)
