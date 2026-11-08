from configparser import ConfigParser
import os

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_DIR = os.path.dirname(BASE_DIR)
CONFIG = ConfigParser()
CONFIG.read(
    [
        os.path.join(PROJECT_DIR, "config.ini.example"),
        os.path.join(PROJECT_DIR, "config.ini"),
    ],
    encoding="utf-8",
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
