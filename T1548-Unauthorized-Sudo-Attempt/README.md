# 🚫 Unauthorized Sudo Attempt Detection – MITRE T1548

This project simulates and detects unauthorized use of the `sudo` command by a non-privileged user. It's a common method attackers use to escalate privileges post-compromise.

---

## 🎯 MITRE ATT&CK Mapping

- **Tactic**: Privilege Escalation
- **Technique**: T1548.003 – Abuse Elevation Control Mechanism: Sudo

---

## 🧪 Simulation Steps

1. Created a low-privileged user: `testuser`
2. Attempted to run multiple `sudo` commands without proper rights:
   ```bash
   sudo ls /
   sudo whoami
   sudo cat /etc/shadow

Each failed attempt was logged to /var/log/auth.log

## 📥 Data Source
/var/log/auth.log

Ingested using Splunk Universal Forwarder

Sourcetype: linux_secure

## 🔍 Detection Logic (SPL)
spl
Copy
Edit
index=* sourcetype=linux_secure "user NOT in sudoers"
| rex "sudo: *(?<user>\w+)"
| eval event_type="Unauthorized Sudo Attempt"
| table _time user host event_type _raw
| sort -_time

## 🛡️ Alert Details
Name: T1548 – Unauthorized Sudo Attempt

Trigger: Results > 0

Schedule: Every 5 minutes

Action: Log Event + Triggered Alert

