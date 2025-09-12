import inspect
from fastapi import APIRouter

from lib import routes


api_router = APIRouter()

routes = list(filter(lambda x: inspect.ismodule(x[1]), inspect.getmembers(routes)))
[api_router.include_router(route[1].router) for route in routes]
