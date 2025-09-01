# $ExecutionContext.SessionState.LanguageMode = "FullLanguage"

Set-Location C:\Users\PD57215\

$ps_scripts_dir = "\\ad.police.wa.gov.au\UserData\Central\PD57215\WindowsPowerShell\Scripts"
$mend_cli_exe = "C:\mend\cli"

New-Alias gpush $ps_scripts_dir\GitPush.ps1
New-Alias gpsh $ps_scripts_dir\GitPush.ps1
New-Alias gpull $ps_scripts_dir\GitPull.ps1
New-Alias gpll $ps_scripts_dir\GitPull.ps1

New-Alias mend $mend_cli_exe\mend.exe

New-Alias azbast $ps_scripts_dir\BastionConnect.ps1
