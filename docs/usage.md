# Usage Guide

## Quickstart

```bash
make up
```

Provisioning may take several minutes during first run due to package and container downloads.

## Minimal footprint mode

```bash
make up-min
```

Starts only:

- dmz
- monitor

Use this for defensive-only workshops on constrained hardware.

## Day-2 operations

### Check status

```bash
make status
```

### Access each VM

```bash
vagrant ssh attacker
vagrant ssh dmz
vagrant ssh monitor
```

### DMZ operations

On `dmz` VM:

```bash
cd /opt/cyber-range/dmz
docker compose ps
```

### Monitoring operations

On `monitor` VM:

```bash
sudo systemctl status suricata --no-pager
sudo zeek -v
/opt/cyber-range/monitor/capture.sh eth1 30 /tmp/sample.pcap
```

### Offensive operations

On `attacker` VM:

```bash
/opt/cyber-range/tools/recon.sh 192.168.56.0/24
nmap -sV 192.168.56.20
```

## Shutdown and cleanup

```bash
make down
make destroy
```

`destroy` irreversibly removes VM state.
