#Упражнение 7 — Мониторинг загрузки CPU + завершение процессов

#!/bin/bash

REMOTE="user@host"
THRESHOLD=2.0   # load average
PROCESS="python"  # любой процесс для убийства

LOAD=$(ssh "$REMOTE" "uptime | awk -F'load average:' '{print \$2}' | cut -d, -f1")

LOAD=$(printf "%.1f" "$LOAD")

awk_compare=$(awk -v l="$LOAD" -v t="$THRESHOLD" 'BEGIN {print (l > t)}')

if [ "$awk_compare" -eq 1 ]; then
    ssh "$REMOTE" "pkill -f $PROCESS"
    echo "High load ($LOAD), process $PROCESS killed"
else
    echo "Load normal ($LOAD)"
fi

