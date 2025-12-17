#Упражнение 1 — Резервное копирование + перенос на сервер + очистка старых архивов
#!/bin/bash

SOURCE_DIR="/path/to/source"
REMOTE_USER="user"
REMOTE_HOST="1.2.3.4"
REMOTE_DIR="/remote/backup"

ARCHIVE_NAME="backup_$(date +%F_%H-%M-%S).tar.gz"

# 1. Архивируем директорию
tar -czf "$ARCHIVE_NAME" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

# 2. Копируем архив на сервер
scp "$ARCHIVE_NAME" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/"

# 3. Удаляем старые архивы (оставляем 3 последних)
ssh "$REMOTE_USER@$REMOTE_HOST" \
    "cd $REMOTE_DIR && ls -1t backup_*.tar.gz | tail -n +4 | xargs -r rm -f"
