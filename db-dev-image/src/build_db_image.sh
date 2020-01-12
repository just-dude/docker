# Название проекта в нотации kebab-case
PROJECT_NAME_KEBAB_CASE="$1"

# Название проекта в нотации under_case
PROJECT_NAME_UNDER_CASE="$2"

# Имя пользователя БД(совпадает с названием БД)
DB_USER="$PROJECT_NAME_UNDER_CASE"

# Название БД(совпадает с именем пользователя)
DB_NAME="$DB_USER"

# Пароль БД
DB_PASS="changeit"

# Базовый образ postgre
POSTGRES_IMAGE="postgres:9.6.16"

# Путь до дампа с БД
DUMP_PATH="$3"

# Запускаем контейнер postgresql, в котором уже создана БД и пользователь
# -e PGDATA=/tmp/stub - образ
docker run -d -e POSTGRES_PASSWORD=$DB_PASS -e POSTGRES_USER=$DB_USER -e POSTGRES_DB=$DB_NAME -e PGDATA=/tmp/stub --name postgresql $POSTGRES_IMAGE

# Дожидаемся старта контейнера с postgresql
sleep 4

# Копируем фаил с дампом БД в контейнер
docker cp $DUMP_PATH postgresql:/tmp/dump.sql

# Импортируем дамп БД внутри контейнера
docker exec -e PGPASSWORD=$DB_PASS postgresql psql -U $DB_USER -f "/tmp/dump.sql" $DB_NAME

# Удаляем фаил с дампом БД из контейнера
docker exec postgresql rm /tmp/dump.sql

# Останавливаем контейнер с postgresql
docker stop postgresql

# Создаём образ из контейнера с созданной БД и коммитим его в репозиторий
docker commit postgresql "$PROJECT_NAME_KEBAB_CASE-dev-db"

# Удаляем контейнер с postgresql
docker rm postgresql