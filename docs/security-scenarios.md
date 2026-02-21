# Security Scenarios

## Threat simulation goals

The goal is to map realistic adversary actions to defensive telemetry and response workflows.

## Offensive use cases

1. **Network discovery**
   - Enumerate live hosts and open ports on `192.168.56.0/24`
   - Identify DMZ web services and technology stack

2. **Web exploitation practice**
   - Test common vulnerabilities in DVWA modules
   - Exercise OWASP Top 10 techniques against Juice Shop

3. **Credential attack simulation (controlled)**
   - Perform low-volume credential stuffing or brute-force exercises
   - Measure IDS detection and threshold tuning outcomes

4. **Post-exploitation simulation (future AD extension)**
   - Domain reconnaissance and privilege escalation scenarios
   - Lateral movement chain simulation

## Defensive monitoring workflows

1. **Suricata alert validation**
   - Run attacker scans and inspect generated IDS events
   - Tune signatures to reduce false positives

2. **Zeek protocol analytics**
   - Inspect conn/http logs for suspicious patterns
   - Correlate scan bursts with web transaction anomalies

3. **Packet forensics**
   - Capture pcap from monitor node
   - Reconstruct timeline of attacker activity

4. **Purple-team feedback loop**
   - Replay known offensive actions
   - Update detections and document improved signal quality

## Scenario templates

- **Scenario A**: External recon + DMZ enumeration
- **Scenario B**: SQLi/XSS probing + alert triage
- **Scenario C**: Brute-force simulation + threshold tuning
- **Scenario D**: Full kill-chain rehearsal with retrospective analysis

## Rules of engagement

- Only operate inside authorized lab boundaries
- Do not bridge this range to production networks
- Log all exercise assumptions and outcomes
