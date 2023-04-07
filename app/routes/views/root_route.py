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
    return templates.TemplateResponse("login.html", {"request": request, "layout": "full_screen"})

@router.get("home", response_class=HTMLResponse)
async def home(request: Request):
    return templates.TemplateResponse("home.html", {"request": request, "layout": "vertical"})

@router.get("messages", response_class=HTMLResponse)
async def messages(request: Request):
    return "Some Messages"