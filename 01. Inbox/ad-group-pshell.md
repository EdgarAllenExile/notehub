# Longway to do a simple thing

First, you need to find the base list for what you want:
`$users = @(Get-ADGroupMember -Identity 'Ro.WheatbeltDistrict')`

Then you need to refine that: $filteredUsers = $users | Where-Object { $_.distinguishedName -notlike "*Sworn Officer" }

Then you need to actually test against what you want to look for: `$longUsers = $expandedUsers  | ForEach-Object {
>> $user = $_
>> Get-AdGroupMember -Identity 'Ro.App.SILVAHub.Unrestricted' | Where-Object { $_.name -eq $user.name } }`

and of course, then output to file
