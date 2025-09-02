# Bastion Connectivity

## Suggestions for making this work

Referencing the following docs from MS:

- https://learn.microsoft.com/en-us/azure/bastion/connect-vm-native-client-windows
- https://learn.microsoft.com/en-us/azure/bastion/connect-vm-native-client-windows#connect-to-a-vm---tunnel-command

There is some ambiguity around which version of the connection is going to be the best. There are ultimately three different protocols or options; ssh, rdp and tunnel.

### Ssh

### Rdp

I have tried rdp through the standard interface, however this just appears to open up the regular remote desktop interface which is not the intended usecase.

### Tunnelling

### Other

It is possible that opening this up as a container image on a developer's personal machine and then connecting it that way is going to be the preferred method. 

This is still TBA however.

## Things we tried that didn't work

There were a few alternative methods and technology that I tried in an effort to work out connectivity to other functions. This included two types of tunnels to a VSC Client as well as connecting to the existing Bastion instance, which did not work because of the SKU it was.

Tunneling to the VSC client would probably have worked if we were able to log into them using our WAPF accounts. I think it would have worked quite nicely with our personal GH accounts, but that feels a bit on the nose.

## What Does Seem to Work

The following is a quick overview of what I think currently works:

    - RDP
    - Tunnelling
    - SSH

All of the above is pretty clean and simple using the bastion native client

### Docker Context

Hopefully, we can make containers on our local machines, attach the files and then attach them too the remote context

### SSH Key

Using ssh from a local machine, to the remote vm appears to have a bit of trouble getting passed / through the admin user part to get the key. I have been able to get around this in part by creating a local user: corelocal / CoreMobility12 

This then allows me to use that user's credentials when I eventually get to the server. See this article from MS for more info: `https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_keymanagemen`

In particular, the interesting part is as follows: 

``` powershell Regular User
# Get the public key file generated previously on your client.
$authorizedKey = Get-Content -Path $env:USERPROFILE\.ssh\id_ecdsa.pub

# Generate the PowerShell command to run remotely that copies the public key file generated previously on your client to the authorized_keys file on your server.
$remotePowershell = "powershell New-Item -Force -ItemType Directory -Path $env:USERPROFILE\.ssh; Add-Content -Force -Path $env:USERPROFILE\.ssh\authorized_keys -Value '$authorizedKey'"

# Connect to your server and run the PowerShell command by using the $remotePowerShell variable.
ssh username@domain1@contoso.com $remotePowershell
```

``` powershell Admin User
# Get the public key file generated previously on your client.
$authorizedKey = Get-Content -Path $env:USERPROFILE\.ssh\id_ecdsa.pub

# Generate the PowerShell command to run remotely that copies the public key file generated previously on your client to the authorized_keys file on your server.
$remotePowershell = "powershell Add-Content -Force -Path $env:ProgramData\ssh\administrators_authorized_keys -Value '''$authorizedKey''';icacls.exe ""$env:ProgramData\ssh\administrators_authorized_keys"" /inheritance:r /grant ""Administrators:F"" /grant ""SYSTEM:F"""

# Connect to your server and run the PowerShell command by using the $remotePowerShell variable.
ssh username@domain1@contoso.com $remotePowershell
```

One thing to note on the above is that I think since I am hooking into local host, I thiiiiink there is a bit of a fuck around with $envs, I have made it work successfully by just replacing $userprofile with home dir ~ in regular user, but have not tried for admin user.

If you are creating a new user, you must then also remember to put it into the docker-users group

So I am not actually sure why this was such a fuck around, but I did eventually get this working by turning off the Administrator auth keys, so if we are going to do this again, USE THE REGULAR ACCOUNT VERSION
