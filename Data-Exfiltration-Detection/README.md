# T1005 - Data Staged for Exfiltration (Red Team Simulation & Blue Team Detection)

This project simulates **MITRE ATT&CK Technique T1005: Data from Local System**, focusing on staging sensitive files for exfiltration. The scenario replicates how an attacker would compress sensitive data from a compromised Ubuntu server into a ZIP file and stage it in `/tmp/` for exfiltration.

---

## 🛠️ Red Team Simulation

### Objective:
Access and prepare sensitive files (`.conf`, `.bash_history`, `.ssh`) for exfiltration using standard Linux utilities.

### Steps Performed:
1. Gained persistent SSH access from attacker Kali to Ubuntu server.
2. Created `/tmp/exfil` directory and copied:
   - `/etc/*.conf`
   - `~/.bash_history`
   - `~/.ssh/*`
3. Compressed data into `/tmp/data_loot.zip`:
   
   zip -r /tmp/data_loot.zip /tmp/exfil

Used logger to simulate system-level visibility:


logger "Exfiltration: data_loot.zip created in /tmp"
## 🔍 Blue Team Detection (via Splunk)

📁 Log Sources:
/var/log/auth.log

/var/log/syslog

/home/user/.bash_history

/var/log/ufw.log

## 📊 Detection Queries:

1. Sensitive File Access

2.index=* (".bash_history" OR ".ssh" OR "*.conf")

| table _time, host, user, message

3. Archive Utility Use

index=* ("zip " OR "tar ")

| table _time, host, user, message

3. File Created in /tmp

index=* "/tmp/" ("data_loot" OR ".zip" OR ".tar")

| table _time, host, user, message

## 4. Combined Timeline
   
index=* (".bash_history" OR ".conf" OR ".ssh" OR "/tmp/" OR "data_loot.zip" OR "zip " OR "tar ")

| table _time, host, user, message

| sort _time

## 🛡️ Alert Rule
Name: Suspicious Archive Activity in /tmp

Trigger: If zip is used on /tmp/ or data_loot.zip is created

Threshold: 1 match per user within 15 minutes

Action: Email + Notable Event in SOC dashboard

## 📸 Screenshots

See screenshots/ for evidence:

Creation of data_loot.zip

Splunk detection query

Triggered alert

## 👨‍💼 Author
Vinay Raghavendra B V 
Blue Team | Cybersecurity Student | SOC Simulation Projects
