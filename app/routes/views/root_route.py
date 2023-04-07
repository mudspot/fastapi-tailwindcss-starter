from fastapi import APIRouter, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

from app.core import global_state
from app.core.global_config import app_config

router = APIRouter()
router.prefix = "/"

templates: Jinja2Templates = global_state.templates


@router.get("", response_class=HTMLResponse)
async def root(request: Request):
    return templates.TemplateResponse("login.html", {"request": request})

@router.get("messages", response_class=HTMLResponse)
async def messages(request: Request):
    return "Some Messages"