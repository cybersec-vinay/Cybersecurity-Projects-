# 🔍 YARA Detection - MITRE T1027: Obfuscated Command Execution

This project focuses on detecting base64-encoded PowerShell commands using a YARA rule. This technique aligns with MITRE ATT&CK T1027, where attackers obfuscate commands to avoid detection.

## 🧠 What We Did

- Created a suspicious PowerShell script (`suspicious.ps1`) with base64-encoded content.
- Wrote a YARA rule to detect:
  - Usage of `powershell`
  - Use of the `-enc` flag (short for encodedcommand)
  - Presence of base64 strings (detected via regex)
- Tested against a benign file (`normal.txt`) to ensure no false positives.

## 🛡️ MITRE Technique

- **T1027: Obfuscated Files or Information**

## 📜 Detection Rule (YARA)

This YARA rule identifies obfuscated PowerShell commands using base64 encoding.


