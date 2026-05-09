#!/usr/bin/with-contenv bashio

bashio::log.info "Konfigurowanie MeshMonitor..."

# Wczytaj opcje z Home Assistant
NODE_IP=$(bashio::config 'meshtastic_node_ip')
NODE_PORT=$(bashio::config 'meshtastic_node_port')
ADMIN_PASS=$(bashio::config 'admin_password')
LOG_LEVEL=$(bashio::config 'log_level')
TZ=$(bashio::config 'timezone')
HA_URL=$(bashio::config 'ha_url')
SESSION_SECRET=$(bashio::config 'session_secret')

# Jeśli session_secret jest puste, wygeneruj losowy
if [ -z "${SESSION_SECRET}" ]; then
    SESSION_SECRET=$(cat /proc/sys/kernel/random/uuid | tr -d '-')
fi

mkdir -p /data/meshmonitor

cat > /opt/meshmonitor/.env.production << EOF
MESHTASTIC_NODE_IP=${NODE_IP}
MESHTASTIC_NODE_PORT=${NODE_PORT}
PORT=3001
HOST=0.0.0.0
NODE_ENV=production
DATA_DIR=/data/meshmonitor
DATABASE_URL=file:/data/meshmonitor/meshmonitor.db
ALLOWED_ORIGINS=${HA_URL},*
IFRAME_ALLOWED_ORIGINS=${HA_URL}
SESSION_SECRET=${SESSION_SECRET}
TRUST_PROXY=true
LOG_LEVEL=${LOG_LEVEL}
TZ=${TZ}
EOF

if [ ! -f "/data/meshmonitor/.initialized" ]; then
    bashio::log.info "Pierwsze uruchomienie - ustawiam haslo admina..."
    echo "ADMIN_PASSWORD=${ADMIN_PASS}" >> /opt/meshmonitor/.env.production
    touch /data/meshmonitor/.initialized
fi

bashio::log.info "Uruchamiam MeshMonitor..."
cd /opt/meshmonitor
exec node dist/server/index.js
