import flet as ft
import os
import sys

APP_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "app")
sys.path.insert(0, APP_DIR)


def main(page: ft.Page):
    from modules.auth import LoginPage
    from database import User
    import config

    page.title = "ООО «Обувь» - Каталог товаров"
    page.theme_mode = ft.ThemeMode.LIGHT
    page.padding = 0
    page.scroll = ft.ScrollMode.ADAPTIVE

    page.bgcolor = "#FFFFFF"
    page.window.icon = config.APP_ICON

    def route_change():
        current_user = page.client_storage.get("current_user")
        if current_user:
            current_user = User(current_user)

        page.clean()
        if not current_user:
            login_page = LoginPage(page)
            page.add(
                ft.Container(
                    expand=True,
                    content=login_page.build(),
                )
            )
            page.update()
            return

        # маршруты
        if page.route in ("/", "", None, "/catalog"):
            from modules.product_list import ProductListPage

            product_page = ProductListPage(page, current_user)
            page.add(
                ft.Container(
                    expand=True,
                    content=product_page.build(),
                )
            )
        elif page.route == "/catalog/new":
            from modules.new_product import NewProductPage

            new_product_page = NewProductPage(page, current_user)
            page.add(
                ft.Container(
                    expand=True,
                    content=new_product_page.build(),
                )
            )
        elif page.route.startswith("/catalog/"):
            parts = page.route.split("/")
            try:
                product_id = int(parts[-1])
            except ValueError:
                page.go("/catalog")
                return

            from modules.edit_product import EditProductPage

            edit_page = EditProductPage(page, current_user, product_id)
            page.add(
                ft.Container(
                    expand=True,
                    content=edit_page.build(),
                )
            )
        elif page.route == "/orders":
            from modules.orders import OrdersPage

            orders_page = OrdersPage(page, current_user)
            page.add(
                ft.Container(
                    expand=True,
                    content=orders_page.build(),
                )
            )
        elif page.route == "/orders/new":
            from modules.new_order import NewOrderPage

            new_order_page = NewOrderPage(page, current_user)
            page.add(
                ft.Container(
                    expand=True,
                    content=new_order_page.build(),
                )
            )
        elif page.route.startswith("/orders/"):
            parts = page.route.split("/")
            try:
                order_id = int(parts[-1])
            except ValueError:
                page.go("/orders")
                return

            from modules.edit_order import EditOrderPage

            edit_page = EditOrderPage(page, current_user, order_id)
            page.add(
                ft.Container(
                    expand=True,
                    content=edit_page.build(),
                )
            )

        else:
            page.add(
                ft.Container(
                    expand=True,
                    content=ft.Text("404 — Страница не найдена"),
                )
            )

        page.update()

    # связываем обработчик (исполняется при page.go(...))
    page.on_route_change = lambda e: route_change()

    if not page.route:
        page.go("/catalog")
    else:
        route_change()


if __name__ == "__main__":
    import config

    ft.app(
        target=main,
        assets_dir=os.path.join(APP_DIR, "assets"),
        upload_dir=config.TOVAR_IMAGES_DIR,
    )
