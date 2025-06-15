#  Detecting SSH Key-Based Persistence (MITRE T1098.004)

## 🎯 Objective
Simulate and detect adversary persistence using SSH public key injection into `~/.ssh/authorized_keys` file on a Linux system.

---

## 🧪 Attack Simulation (Red Team – Kali)

1. Generate SSH key pair:
  
   ssh-keygen -t rsa -f attacker_id_rsa

## Inject public key on target system:


echo "<attacker-id_rsa.pub>" >> ~/.ssh/authorized_keys
## Log in via private key:

ssh -i attacker_id_rsa user@target
## 🛡️ Detection (Blue Team – Splunk)
✅ Logs Monitored:
/var/log/auth.log

/var/log/syslog

~/.bash_history

## 🔎 Detection Queries
1. Identify SSH Logins via Public Key 

index=* "Accepted publickey"

| table _time, host, user, message

2. Extract IPs from Key-Based Logins

index=* "Accepted publickey"
| rex "from (?<src_ip>\d+\.\d+\.\d+\.\d+)"
| stats count by user, src_ip

3. Detect .ssh/authorized_keys Modifications
index=* authorized_keys OR ".ssh" OR "ssh-rsa"
| table _time, user, host, message
## 🧠 Final Correlation Query

index=* "Accepted publickey" OR authorized_keys OR ".ssh" OR "ssh-rsa"

| eval ssh_persistence=if(like(_raw, "%authorized_keys%") OR like(_raw, "%ssh-rsa%"), "Key Modified", "Key Login")

| rex "from (?<src_ip>\d+\.\d+\.\d+\.\d+)"

| stats earliest(_time) as first_seen, latest(_time) as last_seen, values(host) as hosts, values(user) as users, values(ssh_persistence) as activities by src_ip

| where match(activities, "Key Modified") AND match(activities, "Key Login")

## 📊 Visuals

Splunk table showing attackers' IPs, users accessed, and timeline of key injection + login.

Timechart dashboard showing spike in key-based logins.

## 📌 MITRE Mapping
 
 T1098.004 – Account Manipulation: SSH Authorized Keys

T1078 – Valid Accounts


## 📚 Learnings

Real-world detection of stealthy persistence techniques

Log correlation across auth.log, syslog, and bash_history

Threat hunting for abnormal login behavior
