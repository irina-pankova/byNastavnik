#Упражнение 2 — Автообновление + email + перезагрузка
#!/bin/bash

REMOTE="user@host"
EMAIL="you@example.com"

ssh "$REMOTE" '
    apt update -y
    apt full-upgrade -y

    if [ -f /var/run/reboot-required ]; then
        echo "Server rebooted after update" | mail -s "Reboot notice" '"$EMAIL"'
        reboot
    else
        echo "No reboot needed"
    fi
'
