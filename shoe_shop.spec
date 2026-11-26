# PyInstaller build configuration for the ShoeShop Flet application.
from pathlib import Path


project_dir = Path(SPECPATH)

a = Analysis(
    [str(project_dir / "main.py")],
    pathex=[str(project_dir), str(project_dir / "app")],
    binaries=[],
    datas=[
        (str(project_dir / "app" / "assets"), "app/assets"),
        ("config.ini", "."),
    ],
    hiddenimports=["psycopg2", "psycopg2._psycopg"],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
)

pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.datas,
    [],
    name="shoe_shop",
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    console=True,
)
