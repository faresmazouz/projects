# ENTERPRISE-CYBER-RANGE

A portfolio-ready, automated cybersecurity training platform that emulates a segmented enterprise environment for red team and blue team exercises.

## Project overview

**ENTERPRISE-CYBER-RANGE** is an Infrastructure as Code (IaC) lab built with Vagrant, VirtualBox, Bash provisioning, and Docker. It provides a controlled environment where security professionals and students can simulate realistic attack chains and defensive monitoring workflows.

This project is designed for:

- Recruiters evaluating practical cyber engineering skills
- Engineering schools running hands-on cyber training labs
- Security teams validating detection and incident response playbooks

## Architecture explanation

The platform provisions three Linux-based nodes on an isolated `192.168.56.0/24` range:

- **Attacker Node (`192.168.56.10`)**: reconnaissance and offensive tooling
- **DMZ Node (`192.168.56.20`)**: vulnerable web apps (DVWA, OWASP Juice Shop) in Docker
- **Monitoring Node (`192.168.56.30`)**: Suricata IDS + Zeek network analysis

A future internal AD segment is documented for hybrid Windows/Linux enterprise simulation.

## Lab components

- Multi-machine Vagrant orchestration (`Vagrantfile`)
- Automated provisioning scripts in Bash (`provision/*.sh`)
- Containerized vulnerable applications (`provision/dmz/docker-compose.yml`)
- Operational helper commands (`Makefile`)
- Extended technical documentation (`docs/*`)

## Requirements

- Host with **16 GB RAM minimum** (recommended baseline)
- VirtualBox 7+
- Vagrant 2.3+
- Internet access for package and container image downloads

## Installation guide

```bash
git clone <your-fork-or-repo-url>
cd ENTERPRISE-CYBER-RANGE
make up
```

For reduced host usage (without attacker VM):

```bash
make up-min
```

## Usage instructions

### Start the platform

```bash
make up
```

### Check VM status

```bash
make status
```

### Access nodes

```bash
vagrant ssh attacker
vagrant ssh dmz
vagrant ssh monitor
```

### Useful attacker command

```bash
/opt/cyber-range/tools/recon.sh 192.168.56.0/24
```

### Access vulnerable apps from host browser

- DVWA: `http://192.168.56.20:8080`
- Juice Shop: `http://192.168.56.20:3000`

### Stop or remove environment

```bash
make down
make destroy
```

## Security disclaimer

This project intentionally deploys vulnerable applications and offensive tools for **authorized training only**. Never expose this environment to public networks or production infrastructure.

## Example attack scenarios

1. Recon from attacker VM to discover exposed services in DMZ
2. Web exploitation attempts against DVWA/Juice Shop
3. Traffic visibility and alert validation via Suricata and Zeek
4. Purple-team exercise: tune detection rules after attack replay

See full walkthrough ideas in [`docs/security-scenarios.md`](docs/security-scenarios.md).

## Future improvements roadmap

- Add optional pfSense gateway/firewall VM with VLAN segmentation
- Add AD lab automation (Windows Server + Windows 10 templates)
- Add SIEM integration (Wazuh/Elastic/OpenSearch)
- Add CI pipeline for linting/provisioning checks
- Add ATT&CK-mapped scenario packs and scoring

## Portfolio description

This repository demonstrates end-to-end platform engineering for cybersecurity labs:

- Network architecture design
- Attack surface emulation
- Defensive telemetry engineering
- Reproducible environment provisioning
- Documentation and operational maturity

## Skills demonstrated

- Cybersecurity architecture
- Network segmentation and threat simulation
- Linux systems engineering
- Bash automation and IaC patterns
- Dockerized service deployment
- Detection engineering foundations (Suricata, Zeek)

## Additional documentation

- [Architecture](docs/architecture.md)
- [Network Design](docs/network.md)
- [Usage Guide](docs/usage.md)
- [Security Scenarios](docs/security-scenarios.md)
- [Diagram Placeholders](docs/diagrams/README.md)
