rule Detect_PowerShell_EncodedCommand
{
    meta:
        description = "Detects base64-encoded PowerShell execution"
        author = "Vinay Raghavendra"
        threat_level = 3
        created = "2025-06-25"

    strings:
        $cmd = /powershell\s+(-enc|-encodedCommand)/ nocase
        $b64 = /[A-Za-z0-9+\/=]{20,}/

    condition:
        $cmd and $b64
}
