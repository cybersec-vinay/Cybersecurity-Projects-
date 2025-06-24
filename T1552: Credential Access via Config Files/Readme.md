# 🛡️ Day 21 – MITRE T1552: Unsecured Credential Access via Config Files

## 🎯 Technique Overview
**MITRE ID:** T1552  
**Tactic:** Credential Access  
**Technique:** Unsecured Credentials in Configuration Files

Many applications store sensitive credentials (e.g., passwords, API tokens, secrets) directly in config files such as `.conf`, `.env`, `.ini`, or `.cnf`. This lab simulates a real-world attacker scanning, collecting, and exfiltrating these secrets — and detects the activity using Splunk.

---

## 🔴 Red Team Simulation – Credential Theft + Exfiltration

| Step | Action |
|------|--------|
| 1 | Searched for keywords like `password=`, `api_key=`, `secret=`, `token=` in `/etc` and common config directories |
| 2 | Copied sensitive config files (e.g., `/etc/mysql/debian.cnf`, `/etc/environment`) to a staging directory |
| 3 | Compressed them into a `.zip` file and exfiltrated to a remote listener on Kali using `curl` |

---

## 🟦 Blue Team Detection – Splunk Queries

| Detection | Description | Sample Splunk Query |
|-----------|-------------|----------------------|
| Suspicious Keyword in Config | Search logs for credential-like strings | `index=* ("password=" OR "api_key=" OR "secret=" OR "token=")` |
| Access to Known Config Files | Detect access to common sensitive files | `index=* source="*.bash_history" ("debian.cnf" OR ".env" OR ".ini")` |
| Data Exfiltration via curl | Detect outbound file uploads | `index=* ("curl" OR "wget") ("POST" OR "-F" OR "@")` |

---

## 🖼️ Screenshots to Include

- `grep_passwords.png`: Secrets exposed in terminal
- `creds_zip_exfil.png`: curl exfiltration attempt
- `splunk_query_results.png`: Detection of sensitive keyword access
- `bash_history_logs.png`: curl command trace in user logs

---
## ✅ Outcome

This simulation demonstrated how attackers can silently harvest sensitive credentials without triggering antivirus or EDR tools. It reinforced the value of log monitoring, `.bash_history`, and behavioral analytics in modern blue team workflows.
