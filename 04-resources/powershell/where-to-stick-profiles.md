# Where to Stick PowerShell Profiles

The profile file, `Microsoft.PowerShell_profile.ps1` wants to live in the WindowsPowerShell directory which equates to approximately the containing directory in the $profile env var.

For my current Win11 machine at work, that's about here:
`\\ad.police.wa.gov.au\UserData\Central\PD57215\WindowsPowerShell\`

The profile script expects a 'Scripts' directory within that location, which contains Bastion Connect, GitPush and Git Pull
