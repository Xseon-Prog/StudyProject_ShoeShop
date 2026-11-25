import os
import sys
import time

import psycopg2


def main() -> int:
    database_name = os.getenv("DB_NAME", "shoe_store")

    for attempt in range(1, 11):
        try:
            with psycopg2.connect(
                host=os.getenv("DB_HOST", "db"),
                port=os.getenv("DB_PORT", "5432"),
                dbname=database_name,
                user=os.getenv("DB_USER", "postgres"),
                password=os.getenv("DB_PASSWORD", ""),
                connect_timeout=5,
            ) as connection:
                with connection.cursor() as cursor:
                    cursor.execute(
                        "SELECT COUNT(*) FROM information_schema.tables "
                        "WHERE table_schema = 'public' AND table_type = 'BASE TABLE'"
                    )
                    table_count = cursor.fetchone()[0]

            print(f"OK: база={database_name}; таблиц={table_count}")
            return 0
        except psycopg2.OperationalError as error:
            print(f"Попытка {attempt}/10: {error}", file=sys.stderr)
            time.sleep(2)

    print("Ошибка: подключение к PostgreSQL не установлено", file=sys.stderr)
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
