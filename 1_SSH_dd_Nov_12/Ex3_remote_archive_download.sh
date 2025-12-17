#Упражнение 3 — Архивирование → скачивание → разархивирование
#!/bin/bash

REMOTE_USER="user"
REMOTE_HOST="1.2.3.4"
REMOTE_PATH="/path/to/remote/dir"
LOCAL_DIR="/path/to/local"
ARCHIVE="backup_$(date +%Y-%m-%d).tar.gz"

# Архивирование на сервере
ssh "$REMOTE_USER@$REMOTE_HOST" \
    "tar -czf /tmp/$ARCHIVE -C \"\$(dirname \"$REMOTE_PATH\")\" \"\$(basename \"$REMOTE_PATH\")\""

# Скачивание
scp "$REMOTE_USER@$REMOTE_HOST:/tmp/$ARCHIVE" "$LOCAL_DIR/"

# Распаковка
tar -xzf "$LOCAL_DIR/$ARCHIVE" -C "$LOCAL_DIR"

