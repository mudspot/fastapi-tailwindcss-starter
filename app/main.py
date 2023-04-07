import uuid

from fastapi import FastAPI, HTTPException, Request, status
from fastapi.encoders import jsonable_encoder
from fastapi.middleware.cors import CORSMiddleware
from fastapi.middleware.gzip import GZipMiddleware
from fastapi.responses import JSONResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

from app.core import create_start_app_handler, create_stop_app_handler, global_state
from app.core.global_config import app_config
from app.logger import setup_logging
from app.models.exceptions.auth_exception import AuthenticationError, AuthorizationError
from app.modules import apis_module, users_module, views_module

app = FastAPI(
    title="Vosmos",
    version=app_config.API_VERSION,
    docs_url="/api/docs",
    redoc_url="/api/redoc",
    openapi_url="/api/openapi.json",
)

app.mount("/assets", StaticFiles(directory="app/assets"), name="assets")
global_state.templates = Jinja2Templates(directory="app/templates")


# Inject Request Ids
@app.middleware("http")
async def request_middleware(request: Request, call_next):
    request.state.request_id = uuid.uuid4().hex
    request.state.request_ip = request.client.host
    request.state.request_method = request.method
    # add record here.!
    response = await call_next(request)
    return response


# Set all CORS enabled origins
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.add_middleware(GZipMiddleware)


# Register Exceptions
@app.exception_handler(HTTPException)
async def http_exception(request: Request, exc: HTTPException):
    status_code = exc.status_code
    error_model = (
        AuthenticationError
        if status_code == status.HTTP_403_FORBIDDEN
        else AuthorizationError
    )
    return JSONResponse(
        status_code=exc.status_code,
        content=jsonable_encoder(error_model(message=exc.detail)),
    )


app.add_event_handler("startup", setup_logging)

# Database Connection
app.add_event_handler("startup", create_start_app_handler(app))
app.add_event_handler("shutdown", create_stop_app_handler(app))

app.add_event_handler("startup", users_module.mount(app))
app.add_event_handler("startup", apis_module.mount(app))
app.add_event_handler("startup", views_module.mount(app))
