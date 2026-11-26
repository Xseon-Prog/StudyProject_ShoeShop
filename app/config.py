from configparser import ConfigParser
import os
import sys

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_DIR = os.path.dirname(BASE_DIR)
RUNTIME_DIR = getattr(sys, "_MEIPASS", PROJECT_DIR)
CONFIG = ConfigParser()
CONFIG.read(
    [
        os.path.join(PROJECT_DIR, "config.ini.example"),
        os.path.join(PROJECT_DIR, "config.ini"),
        os.path.join(RUNTIME_DIR, "config.ini"),
    ],
    encoding="utf-8-sig",
)

DATABASE_CONFIG = CONFIG["database"]
DB_CONFIG = {
    "host": DATABASE_CONFIG.get("host", "localhost"),
    "database": DATABASE_CONFIG.get("name", "shoe_store"),
    "user": DATABASE_CONFIG.get("user", "postgres"),
    "password": DATABASE_CONFIG.get("password", ""),
    "port": DATABASE_CONFIG.getint("port", 5432),
}

ASSETS_DIR = os.path.join(BASE_DIR, "assets")
IMAGES_DIR = os.path.join(ASSETS_DIR, "images")
TOVAR_IMAGES_DIR = os.path.join(IMAGES_DIR, "tovar")

APP_TITLE = "ООО «Обувь» - Магазин обуви"
APP_ICON = os.path.join(IMAGES_DIR, "Icon.ico")
PLACEHOLDER_IMAGE = os.path.join(IMAGES_DIR, "picture.png")
LOGO_IMAGE = os.path.join(IMAGES_DIR, "Icon.png")

# Paths used by Flet's asset server (assets_dir points to app/assets).
ASSET_IMAGES_DIR = "images"
ASSET_TOVAR_IMAGES_DIR = "images/tovar"
ASSET_PLACEHOLDER_IMAGE = f"{ASSET_IMAGES_DIR}/picture.png"
ASSET_LOGO_IMAGE = f"{ASSET_IMAGES_DIR}/Icon.png"


def asset_product_image(filename: str | None) -> str:
    """Return a path relative to Flet's configured assets directory."""
    if not filename:
        return ASSET_PLACEHOLDER_IMAGE
    return f"{ASSET_TOVAR_IMAGES_DIR}/{os.path.basename(filename)}"
