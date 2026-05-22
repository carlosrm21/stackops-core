#!/bin/bash
BACKUP_DIR="/opt/stackops/backups"
RETENTION_DAYS=7
DATE=$(date +%Y-%m-%d_%H%M%S)
REDIS_DATA_DIR="/var/lib/docker/volumes/stackops-node-app_redis_data/_data"
APP_DATA_DIR="/opt/stackops/stackops-core/stacks/node-app/app"
echo " Iniciando el proceso de respaldo automatizado [$DATE]..."
mkdir -p "$BACKUP_DIR"
echo " Sincronizando memoria de Redis a disco..."
docker exec stackops-redis redis-cli save > /dev/null 2>&1
echo " Comprimiendo datos y archivos de la aplicación..."
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"
tar -czf "$BACKUP_FILE" -C "$REDIS_DATA_DIR" . -C "$APP_DATA_DIR" . 2>/dev/null
if [ $? -eq 0 ]; then
    echo " Respaldo creado exitosamente en: $BACKUP_FILE"
    echo " Tamaño del respaldo: $(du -sh "$BACKUP_FILE" | cut -f1)"
else
    echo " Error al crear el archivo de respaldo."
    exit 1
fi
echo " Limpiando respaldos antiguos (Mayores a $RETENTION_DAYS días)..."
find "$BACKUP_DIR" -type f -name "backup_*.tar.gz" -mtime +$RETENTION_DAYS -exec rm {};
echo " Proceso de respaldo finalizado con éxito."
