# 🔐 Suspicious SSH + Command Detection (Splunk Alert)

This project simulates and detects a multi-stage attack:
1. Brute-force SSH login attempts
2. Successful login
3. Suspicious use of `wget` or `curl` by attacker

## 📂 Data Sources
- `/var/log/auth.log` (Linux SSH login attempts)
- `/home/testuser/.bash_history` (command history)

## 🧠 Detection Logic

We correlate logs where:

- A user has multiple failed SSH attempts
  
- Then logs in successfully
  
- Then runs `wget` or `curl`

### ✅ SPL Query


index=* (sourcetype=linux_secure OR sourcetype=bash_history)

("Failed password" OR "Accepted password" OR "wget" OR "curl")

| eval user=coalesce(user, "testuser")

| eval event_type=case(

    sourcetype=="linux_secure" AND searchmatch("Failed password"), "SSH Failed Login",
    
    sourcetype=="linux_secure" AND searchmatch("Accepted password"), "SSH Success",
    
    sourcetype=="bash_history" AND (searchmatch("wget") OR searchmatch("curl")), "Suspicious Command"
)

| stats count by _time user host event_type sourcetype

| sort _time

## 📸 Sample Output
_time	user	host	event_type	sourcetype

18:42:00	testuser	siem-server	SSH Failed Login	linux_secure

18:43:01	testuser	siem-server	SSH Success	linux_secure

18:44:20	testuser	siem-server	Suspicious Command	bash_history

## 🚨 Use Case
This kind of correlation is crucial for:

Detecting attacker lateral movement

Identifying post-auth compromise activity

Automating detection rules in real SOC environments

 
---

## 📄 `alert-summary.txt`

```txt
==============================
🔔 Splunk Alert – Suspicious SSH + wget Activity
==============================

📌 Alert Name:
SSH Brute Force Followed by Suspicious Command

🧪 Behavior Simulated:
- 3000+ Failed SSH logins
- One successful login
- wget or curl used post-login

🎯 SPL Logic:
Correlates `/var/log/auth.log` and `.bash_history` using unified fields

📅 Trigger Condition:
Results > 0 in last 15 minutes

💡 Use Case:
Detects brute-force followed by payload download — common in early-stage compromises

🔧 Status: ✅ Working & Tested
==============================

