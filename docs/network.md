# Network Design

## Base network

This range uses a host-only VirtualBox network:

- CIDR: `192.168.56.0/24`
- Gateway: host-managed (VirtualBox host-only adapter)

## Static addressing

- `192.168.56.10` → attacker
- `192.168.56.20` → dmz
- `192.168.56.30` → monitor

## Segmentation model

Current implementation keeps all nodes on a controlled private subnet for simplicity and reproducibility.

Recommended evolution for advanced training:

- Add routed subnets or VLAN tagging behind pfSense
- Place DMZ and internal AD endpoints on distinct network segments
- Mirror traffic to monitor using SPAN/TAP equivalent patterns

## Traffic and visibility goals

- Attacker should generate realistic reconnaissance and exploitation traffic
- DMZ should expose HTTP services vulnerable by design
- Monitor should capture packets and IDS events for detection engineering exercises

## Extending with Active Directory

### Planned assets

- Windows Server VM (Domain Controller)
- Windows 10/11 endpoint VM joined to domain

### Suggested addressing extension

- Internal AD subnet: `192.168.57.0/24`
- Example:
  - DC: `192.168.57.10`
  - Client: `192.168.57.20`

### Suggested training tracks

- Kerberos abuse and authentication attacks
- Domain enumeration and privilege escalation
- Lateral movement simulation with controlled tools
- Detection of suspicious logon patterns and protocol anomalies

## Optional pfSense deployment approach

- Add `pfsense` VM with two or more interfaces
- Interface mapping:
  - WAN/attacker-facing
  - DMZ-facing
  - Internal AD-facing (future)
- Implement firewall rules for scenario-specific restrictions
- Enable logging and export events to SIEM stack
