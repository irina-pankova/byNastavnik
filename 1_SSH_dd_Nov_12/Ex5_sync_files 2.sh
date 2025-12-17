#Упражнение 5 — Двусторонняя синхронизация rsync

#!/bin/bash

LOCAL="/LOCAL/PATH/"
REMOTE="user@host:/remote/path/"

rsync -avz --exclude "*.log" "$LOCAL" "$REMOTE" && \
rsync -avz --exclude "*.log" "$REMOTE" "$LOCAL" && \
    echo "local <-> remote OK" || \
    echo "local <-> remote FAIL"

