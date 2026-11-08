## ER-диаграмма базы данных

База данных ShoeShop предназначена для хранения информации о пользователях, товарах каталога и оформленных заказах.

Основные сущности:
- `users` — сведения о пользователях системы и их учётных записях;
- `roles` — роли пользователей и разграничение прав доступа;
- `products` — информация о моделях обуви, стоимости, скидках и наличии;
- `orders` — информация об оформленных заказах, дате создания и статусе;
- `order_items` — состав заказов, количество и стоимость выбранных товаров.

### Отображение остатка товара

- «Много в наличии» — если количество товара больше 5;
- «Мало в наличии» — если количество товара равно 5 или меньше.

### Связи между сущностями

- Одна роль может быть назначена нескольким пользователям (1:N).
- Один пользователь может оформить несколько заказов (1:N).
- Один заказ может содержать несколько позиций (1:N).
- Один товар может входить в состав нескольких заказов (1:N).

### Структура ER-диаграммы

```mermaid
erDiagram
    ROLES ||--o{ USERS : assigns
    USERS ||--o{ ORDERS : creates
    ORDERS ||--|{ ORDER_ITEMS : contains
    PRODUCTS ||--o{ ORDER_ITEMS : includes

    ROLES {
        int id PK
        string name
    }

    USERS {
        int id PK
        string full_name
        string login
        string password
        int role_id FK
    }

    PRODUCTS {
        int id PK
        string name
        decimal price
        decimal discount
        int quantity
    }

    ORDERS {
        int id PK
        int user_id FK
        date created_at
        string status
    }

    ORDER_ITEMS {
        int id PK
        int order_id FK
        int product_id FK
        int quantity
        decimal price
    }
```

Диаграмма представляет концептуальную модель данных учебного проекта и демонстрирует основные сущности и связи между ними.
