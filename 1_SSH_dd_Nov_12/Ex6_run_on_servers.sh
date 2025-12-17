#Упражнение 6 — Выполнение команды на множестве серверов

#!/bin/bash

SERVERS_FILE="servers.txt"
COMMAND="uptime"
LOG="output.log"

> "$LOG"

while read -r SERVER; do
    echo "===== $SERVER =====" >> "$LOG"
    ssh "$SERVER" "$COMMAND" >> "$LOG" 2>&1
done < "$SERVERS_FILE"
