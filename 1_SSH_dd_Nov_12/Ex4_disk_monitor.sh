#Упражнение 4 — Мониторинг диска + уведомление

#!/bin/bash

REMOTE="user@host"
EMAIL="you@example.com"
THRESHOLD=20 # % свободного места

USED=$(ssh "$REMOTE" "df -P / | awk 'NR==2 {print \$5}' | tr -d '%'")

FREE=$((100 - USED))

if [ "$FREE" -lt "$THRESHOLD" ]; then
    echo "Free space less than $THRESHOLD% (now: $FREE%)" \
        | mail -s "Disk alert" "$EMAIL"
fi

