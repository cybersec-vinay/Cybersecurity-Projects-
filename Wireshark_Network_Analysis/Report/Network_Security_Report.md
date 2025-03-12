# 🔍 Network Security Incident Report - Wireshark Analysis

## 📌 1. Summary of Findings  
✔ **Total Packets Captured:** 10,000+  
✔ **Suspicious Activities Detected:**  
  - Brute-force login attempts from **192.168.1.50**  
  - HTTP login credentials sent in plaintext  
  - Possible ARP spoofing attack  

---

## 🔥 2. Threats & Analysis  

### 🚨 1. Brute-force Login Attempts  
- **Source IP:** `192.168.1.50`  
- **Failed Login Attempts:** 100+  
- **Impact:** Attacker trying to guess passwords.  

🛠️ **Mitigation Steps:**  
✔ Block `192.168.1.50` in the firewall  
✔ Implement account lockout policy  
✔ Enforce Multi-Factor Authentication (MFA)  

---

### 🚨 2. Unencrypted HTTP Login Credentials Found  
- **Captured Username & Password:**
- - **Impact:** Attackers can steal credentials over an unencrypted network.  

🛠️ **Mitigation Steps:**  
✔ Disable HTTP login and enforce HTTPS  
✔ Encrypt all sensitive data in transit  

---

### 🚨 3. Possible ARP Spoofing Attack  
- **Attacker MAC Address:** `00:11:22:33:44:55`  
- **Fake Gateway IP:** `192.168.1.1`  
- **Impact:** Attacker can redirect user traffic & intercept sensitive data.  

🛠️ **Mitigation Steps:**  
✔ Enable **Dynamic ARP Inspection (DAI)**  
✔ Use **static ARP tables** to prevent spoofing  

---

## 🛠️ 3. Conclusion & Next Steps  
✔ Immediate priority: Fix **HTTP security issues** and **block brute-force IPs**.  
✔ Next steps: Patch **ARP spoofing risks** and monitor network traffic.  

## 📂 4. Attachments  
📌 `network_capture.pcapng` → Wireshark capture file 

