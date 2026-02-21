#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

log() { echo "[attacker] $1"; }

log "Updating apt cache"
apt-get update -y

log "Installing attacker tooling"
apt-get install -y \
  nmap \
  net-tools \
  dnsutils \
  masscan \
  sqlmap \
  nikto \
  hydra \
  tcpdump \
  wireshark-common \
  curl \
  wget \
  git \
  jq

log "Creating recon helper scripts"
install -d -m 0755 /opt/cyber-range/tools
cat > /opt/cyber-range/tools/recon.sh <<'SCRIPT'
#!/usr/bin/env bash
set -euo pipefail
TARGET_SUBNET="${1:-192.168.56.0/24}"

echo "[recon] Fast host discovery on ${TARGET_SUBNET}"
sudo nmap -sn "${TARGET_SUBNET}"

echo "[recon] Top ports and service enumeration"
sudo nmap -sC -sV -T4 "${TARGET_SUBNET}"
SCRIPT
chmod +x /opt/cyber-range/tools/recon.sh

log "Provisioning complete"
