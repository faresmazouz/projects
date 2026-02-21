#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

log() { echo "[dmz] $1"; }

log "Updating apt cache"
apt-get update -y

log "Installing Docker dependencies"
apt-get install -y ca-certificates curl gnupg lsb-release

install -m 0755 -d /etc/apt/keyrings
if [ ! -f /etc/apt/keyrings/docker.gpg ]; then
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
fi
chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  > /etc/apt/sources.list.d/docker.list

apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

usermod -aG docker vagrant || true

log "Deploying vulnerable applications"
install -d -m 0755 /opt/cyber-range/dmz
cp /vagrant/provision/dmz/docker-compose.yml /opt/cyber-range/dmz/docker-compose.yml

cd /opt/cyber-range/dmz
docker compose pull
docker compose up -d

log "Provisioning complete"
