# 🔐 Brute-Force Attack Detection using Splunk (SOC Analyst Project)

This project simulates a brute-force SSH attack from Kali Linux to Ubuntu and demonstrates how to detect it using Splunk by analyzing failed login attempts in `/var/log/auth.log`.

---

## 🧪 Lab Setup

- **Attacker Machine**: Kali Linux
- **Target Machine**: Ubuntu Server with SSH enabled
- **SIEM**: Splunk Enterprise (Indexer + Search Head on same Ubuntu machine)
- **Tools Used**: Hydra, Splunk, SSH, Linux CLI, /var/log/auth.log

---

## 💣 Attack Simulation with Hydra

A brute-force SSH attack was launched using Hydra from Kali to Ubuntu.

### Hydra Command Used:


hydra -l testuser -P /usr/share/wordlists/rockyou.txt ssh://<Ubuntu-IP>


- `******` is the target user on Ubuntu
- `***.***.***.***` is the IP address of the Ubuntu machine
- `rockyou.txt` was used as the password list

This simulated hundreds of failed login attempts and triggered log entries in `/var/log/auth.log`.

---

## 📥 Log Monitoring Setup in Splunk

Ubuntu’s log file `/var/log/auth.log` was added as a monitored input in Splunk via:

- **Settings → Data Inputs → Files & Directories**
- **Sourcetype**: `linux_secure`
- **Index**: `main` (or custom index like `linux_logs`)

Splunk began ingesting the failed SSH login logs in real time.

---

## 📊 Detection Logic in Splunk (SPL Query)

The following SPL (Search Processing Language) query was used to identify brute-force behavior:

index=* sourcetype=linux_secure "Failed password"
| stats count by user, src, host
| where count > 5


This query looks for repeated failed login attempts by the same user and source IP and flags patterns that indicate brute-force attacks.

---

## 📑 Incident Report Summary

- **Date**: June 2, 2025
- **Source IP (Attacker)**: ***.***.***.** (Kali Machine)
- **Target Host**: Ubuntu SSH Server
- **Username Targeted**: ******
- **Log Source**: /var/log/auth.log
- **Sourcetype**: linux_secure
- **Detection Method**: SPL query on Splunk
- **Events Detected**: 3570+ failed SSH login attempts
- **Threat Level**: Medium
- **Recommended Actions**:
  - Block the attacker IP
  - Implement account lockout policy after 5 failed attempts
  - Set up real-time Splunk alerts for login abuse

---

## ✅ Outcome

- Simulated a brute-force SSH attack in a virtual lab
- Detected real-time log data using Splunk
- Created custom SPL detection logic
- Wrote a structured incident report based on detection results
- Learned how to investigate Linux logs and identify suspicious behavior

---

## 📸 Screenshots
- `hydra_attack_terminal.png`: showing the brute-force running
- `auth_log_tail.png`: showing failed log entries
- `splunk_query_result.png`: showing detected brute-force in Splunk
---
