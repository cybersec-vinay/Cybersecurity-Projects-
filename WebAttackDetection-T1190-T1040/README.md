# Web Server Attack Detection (MITRE T1190 + T1040)

## 🎯 Objective

Simulate a real-world scenario where an attacker exploits a public-facing web server using:
- SQL Injection
- Command Injection
- Local File Inclusion (LFI)
- Directory brute-forcing (Nikto)
...and detect them via Apache logs in Splunk.

---

## 🧪 Red Team Simulation

### Target: Apache2 (Ubuntu)
Apache logs at:
/var/log/apache2/access.log


### Attacks from Kali:

# SQL Injection (URL-encoded)
curl "http://<target_ip>/?id=1%27%20OR%20%271%27=%271"

# Command Injection
curl "http://<target_ip>/?cmd=ls;whoami"

# Local File Inclusion
curl "http://<target_ip>/?page=../../../../etc/passwd"

# User-Agent Scanner (sqlmap)
curl -A "sqlmap/1.0" "http://<target_ip>"

# Brute-force scan using Nikto
nikto -host http://<target_ip>

## 🔍 Splunk Detection Queries
1. Combined Query (for screenshot)

index=* sourcetype="access_combined" (
    uri_query="*%27*OR*%27*" OR 
    uri_query="*../../*" OR 
    uri_query="*;*" OR 
    useragent="sqlmap*" OR 
    useragent="nikto*"
)
| table _time, clientip, uri_path, uri_query, useragent, status

2. Top IPs

index=* sourcetype="access_combined"
| top clientip

## 🧠 MITRE ATT&CK Mapping
Technique ID	Description
T1190	Exploit Public-Facing Application
T1040	Network Sniffing & Traffic Monitoring

## 📸 Screenshot Plan

redteam_web_attacks.png – Kali terminal showing curl/nikto attacks

splunk_query_results.png – Detection output for SQLi/LFI/etc.

splunk_useragents.png – Suspicious user-agent filtering

ip_enrichment_vt.png – (Optional) IP checked on VirusTotal/AbuseIPDB

## 📚 Summary

This lab shows how attackers exploit web servers, and how we can:

Detect these in Apache logs

Correlate attack patterns with user-agent and IP

Enrich findings with external intel
