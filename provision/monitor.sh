#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

log() { echo "[monitor] $1"; }

log "Updating apt cache"
apt-get update -y

log "Installing monitoring stack"
apt-get install -y \
  suricata \
  zeek \
  tcpdump \
  jq \
  rsync

log "Enabling Suricata service"
systemctl enable suricata || true
systemctl restart suricata || true

log "Creating helper scripts"
install -d -m 0755 /opt/cyber-range/monitor
cat > /opt/cyber-range/monitor/capture.sh <<'SCRIPT'
#!/usr/bin/env bash
set -euo pipefail
INTERFACE="${1:-eth1}"
DURATION="${2:-60}"
OUTPUT="${3:-/tmp/range_capture.pcap}"

echo "[monitor] Capturing ${DURATION}s on ${INTERFACE} -> ${OUTPUT}"
sudo timeout "${DURATION}" tcpdump -i "${INTERFACE}" -nn -w "${OUTPUT}" || true
SCRIPT
chmod +x /opt/cyber-range/monitor/capture.sh

log "Provisioning complete"
