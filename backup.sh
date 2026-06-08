#!/bin/bash
# backup.sh - Скрипт для бэкапа конфигов Nginx
# Использование: sudo ./backup.sh

# Переменные
BACKUP_DIR="/opt/backups/nginx"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
NGINX_CONF_DIR="/etc/nginx"
LOG_FILE="/var/log/nginx-backup.log"  # 🆕 Лог-файл

# Создаём папку для бэкапов (не требует sudo, т.к. /opt/backups в нашей зоне)
mkdir -p "$BACKUP_DIR"

# Архивируем конфиг
tar -czf "$BACKUP_DIR/nginx-backup-$DATE.tar.gz" "$NGINX_CONF_DIR"

# Проверяем успех
if [ $? -eq 0 ]; then
    echo "✅ Бэкап создан: $BACKUP_DIR/nginx-backup-$DATE.tar.gz"
    echo "$(date +'%Y-%m-%d %H:%M:%S') Backup OK" >> "$LOG_FILE"  # 🆕 Запись в лог
else
    echo "❌ Ошибка бэкапа!"
    exit 1
fi

echo "Резервное копирование завершено успешно"
# Изучаем Git flow
