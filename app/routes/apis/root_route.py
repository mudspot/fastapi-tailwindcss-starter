from fastapi import APIRouter, Request

from app.core.global_config import app_config

router = APIRouter()
router.prefix = "/api"


@router.get(
    "/healthz", tags=["systems"], name="root:health", operation_id="root_health"
)
async def healthz(request: Request):
    return {
        "version": app_config.API_VERSION,
    }
