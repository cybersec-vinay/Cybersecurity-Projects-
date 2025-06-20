# T1548 - Privilege Escalation via Sudo and Su Detection (Splunk + MITRE ATT&CK)

## 🎯 Objective

Simulate and detect privilege escalation attempts via abuse of `sudo`, `su`, and elevation enumeration commands such as `sudo -l`, as per MITRE ATT&CK technique [T1548](https://attack.mitre.org/techniques/T1548/).

---

## 🛠️ Red Team Simulation Steps

### 1. Successful Sudo Usage

sudo cat /etc/shadow

## 2. Unauthorized Sudo Attempt

## From a user not in the sudoers file
sudo ls

## 3. Su Switch Attempt

su - root

## 4. Optional Enumeration

sudo -l

Use logger if native logging doesn't capture the activity:

logger "Recon: sudo -l run by user1"

### 🔍 Blue Team (Splunk Detection Queries)

## 🔹 Detect Unauthorized Sudo Attempts

 index=* "user NOT in sudoers"
 
 | table _time, host, user, message

## 🔹 Detect All Sudo Commands (Successful or Not)

index=* "COMMAND=/"

| table _time, host, user, message

## 🔹 Detect su Command Usage (Authentication or Access)

index=* "su:" ("authentication failure" OR "session opened")

| table _time, host, user, message

## 🔹 Optional: Detect Enumeration Attempts

index=* "sudo -l"

Use logger if this isn’t captured automatically.

### 🚨 Alerting Use Case

Alert: Unauthorized Privilege Escalation Attempt

Trigger Condition: "user NOT in sudoers" OR su failed 3+ times in 5 mins

Severity: High

Action: Email + Splunk notable alert

Reason: Indicates privilege misuse or lateral movement attempt

### 📸 Screenshots

Check the screenshots/ folder for:

sudo command execution

su authentication attempts

Splunk query matches

Triggered alert evidence

### 📚 MITRE Mapping

Tactic	Technique

Privilege Escalation	T1548 - Abuse Elevation Control Mechanism

Defense Evasion	T1059.003 (for bashrc & crontab in future)


### 👨‍💻 Author

Vinay Raghavendra

SOC Analyst | Cybersecurity Student | Detection Engineer
