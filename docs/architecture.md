# Architecture

## Design goals

ENTERPRISE-CYBER-RANGE emulates a realistic but lightweight enterprise footprint that supports both offensive operations and defensive monitoring on a single 16 GB host.

Core goals:

- Reproducible deployment through IaC
- Clear network segmentation boundaries
- Built-in vulnerable workloads for attack simulation
- Built-in monitoring for detection and forensics training

## Logical zones

1. **Attacker Zone**
   - VM: `attacker`
   - Purpose: reconnaissance, scanning, web testing
   - Tools: nmap, masscan, sqlmap, nikto, hydra, tcpdump

2. **DMZ Zone**
   - VM: `dmz`
   - Purpose: host internet-facing style workloads
   - Services: DVWA, OWASP Juice Shop via Docker Compose

3. **Monitoring Zone**
   - VM: `monitor`
   - Purpose: network detection and packet analytics
   - Services: Suricata IDS, Zeek, tcpdump

4. **Internal Network (planned extension)**
   - Placeholder for AD lab with Windows Server + Windows 10 endpoints
   - Intended to support identity attacks, lateral movement, and blue-team detection engineering

## Resource profile (16 GB host target)

Default VM allocation:

- attacker: 3 GB RAM / 2 vCPU
- dmz: 4 GB RAM / 2 vCPU
- monitor: 4 GB RAM / 2 vCPU

Total allocated: ~11 GB RAM + host overhead.

## Infrastructure as Code strategy

- **Vagrantfile** defines topology, static IPs, and VM-level resources
- **Bash provisioners** provide deterministic system setup
- **Docker Compose** handles vulnerable app deployment in DMZ
- **Makefile** standardizes operator workflow

## Optional pfSense integration

A pfSense VM can be inserted between attacker and enterprise zones to:

- enforce ACLs
- simulate north/south and east/west control points
- mirror traffic to monitoring interfaces

Implementation guidance is provided in [`docs/network.md`](network.md).
