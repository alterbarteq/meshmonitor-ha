#!/usr/bin/with-contenv bashio

bashio::log.info "Konfigurowanie MeshMonitor..."

NODE_IP=$(bashio::config 'meshtastic_node_ip')
NODE_PORT=$(bashio::config 'meshtastic_node_port')
ADMIN_PASS=$(bashio::config 'admin_password')
LOG_LEVEL=$(bashio::config 'log_level')
TZ=$(bashio::config 'timezone')
HA_URL=$(bashio::config 'ha_url')
SESSION_SECRET=$(bashio::config 'session_secret')

if [ -z "${SESSION_SECRET}" ]; then
    SESSION_SECRET=$(cat /proc/sys/kernel/random/uuid | tr -d '-')
fi

mkdir -p /data/meshmonitor

export MESHTASTIC_NODE_IP="${NODE_IP}"
export MESHTASTIC_NODE_PORT="${NODE_PORT}"
export PORT=3001
export HOST=0.0.0.0
export NODE_ENV=production
export DATA_DIR=/data/meshmonitor
export DATABASE_URL="file:/data/meshmonitor/meshmonitor.db"
export ALLOWED_ORIGINS="${HA_URL},*"
export IFRAME_ALLOWED_ORIGINS="${HA_URL}"
export SESSION_SECRET="${SESSION_SECRET}"
export TRUST_PROXY=true
export LOG_LEVEL="${LOG_LEVEL}"
export TZ="${TZ}"

if [ ! -f "/data/meshmonitor/.initialized" ]; then
    bashio::log.info "Pierwsze uruchomienie - ustawiam haslo admina..."
    export ADMIN_PASSWORD="${ADMIN_PASS}"
    touch /data/meshmonitor/.initialized
fi

bashio::log.info "Uruchamiam MeshMonitor ${NODE_IP}:${NODE_PORT}..."
exec /init
