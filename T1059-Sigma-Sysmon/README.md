# Day 24 – Threat Hunting with Sigma + Sysmon

## Objective
Simulate detection of obfuscated PowerShell command execution (MITRE ATT&CK T1059.001) using Sigma rule and analyze Sysmon logs.

## Description
This project focuses on identifying obfuscated PowerShell execution using base64 encoding techniques such as `-enc` or `-encodedCommand`. These techniques are widely used by threat actors for initial access or privilege escalation. We built a Sigma rule to detect such behaviors and converted the rule into various SIEM query formats.

## MITRE ATT&CK Technique
- **T1059.001 – Command and Scripting Interpreter: PowerShell**

## Steps Performed

1. **Analyzed Sysmon Logs**
   - Sample log included PowerShell execution with encoded payload.
   - Extracted fields such as `Image`, `CommandLine`, `User`, and `ParentImage`.

2. **Wrote Sigma Detection Rule**
   - Detected processes where the executable ends with `powershell.exe`
   - Detected base64 encoded flags such as `-enc` or `-encodedCommand`

3. **Converted Sigma Rule**
   - Converted into Splunk SPL, Microsoft Sentinel (KQL), Elastic DSL, Graylog, and QRadar formats.
   - Used Uncoder.io to convert Sigma rule online for testing.

4. **Threat Context**
   - Discussed how attackers use encoded PowerShell for evasion.
   - Explained potential false positives and how SOC teams can refine detection.

## Platforms Tested
- Sigma (YAML)
- Splunk (Converted SPL)
- Sentinel (Converted KQL)
- Elastic (DSL)
- Graylog (Lucene)
- QRadar (AQL)

## Detection Rule Key Fields
- `Image`
- `CommandLine`
- `User`
- `ParentImage`
- `ParentCommandLine`

## Tags
- Sigma
- Threat Hunting
- Sysmon
- MITRE ATT&CK
- Obfuscated Execution
- T1059.001

