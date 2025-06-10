# 🔎 T1046 – Port Scan Detection using UFW + Splunk

This project simulates and detects a port scan using `nmap`, firewall logging (UFW), and Splunk analysis.

---

## 🎯 MITRE Mapping

- **Tactic**: Discovery
- **Technique**: T1046 – Network Service Scanning

---

## 🛠️ Lab Setup

- Kali Linux used as attacker
- Ubuntu SIEM server running UFW + Splunk Forwarder
- Nmap SYN scan command:
  
  nmap -sS -T4 <target-ip>

## Log Source
/var/log/ufw.log

##  Detection Logic (SPL)

index=* sourcetype=ufw "UFW BLOCK"
| rex "SRC=(?<src_ip>\d{1,3}(?:\.\d{1,3}){3})"
| rex "DPT=(?<dport>\d+)"
| stats count by src_ip dport
| where count > 10
| eval event_type="Potential Port Scan Detected"
| table _time src_ip dport event_type count

## Alert
Name: T1046 - Port Scan Detected

Schedule: Every 15 minutes

Trigger: >10 blocked ports from same source IP


