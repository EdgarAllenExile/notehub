# Dev Containers

## Current

Currently I have this working quite nicely using a pretty rudimentry dev container set up through vs code, nb this is only really local set up 

I also have a pretty decent grasp on the different ways to use Azure Bastion to connect to these things. Notes on that:

- You ssh into the machine using a tunnel first, then effectively ssh'ing to the local host.
- I assume that I will be able to use docker contexts to effectively set the build machine as the docker host, via a bastion tunnel

## To Explore

Things to look at from here, would be how to get the local set up onto the remote server in a useful way. Currently thinking that I will install docker on the remote machine, spin up a bastion tunnel and use docker context to connect to it.

See: `https://medium.com/@rajaravivarman/extending-docker-using-docker-context-to-manage-remote-containers-66b8abc5d245`

Docker on WSL Just in case: `https://www.reddit.com/r/docker/comments/1d7r2qi/guide_how_to_run_docker_on_a_windows_host_without`

Use SSH-Key Gen to create a private key

SSH Keys Quick Guide: `https://code.visualstudio.com/docs/remote/troubleshooting#_container-tips`

Then follow the instructions that are on the ms docs: `https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_keymanagement`

` ssh pd57215@127.0.0.1 -p 50022` should work

```
# By default, the ssh-agent service is disabled. Configure it to start automatically.
# Run the following command as an administrator.
Get-Service ssh-agent | Set-Service -StartupType Automatic

# Start the service.
Start-Service ssh-agent

# The following command should return a status of Running.
Get-Service ssh-agent

# Load your key files into ssh-agent.
ssh-add $env:USERPROFILE\.ssh\id_ecdsa
```

```
# Get the public key file generated previously on your client.
$authorizedKey = Get-Content -Path $env:USERPROFILE\.ssh\id_ecdsa.pub

# Generate the PowerShell command to run remotely that copies the public key file generated previously on your client to the authorized_keys file on your server.
$remotePowershell = "powershell Add-Content -Force -Path $env:ProgramData\ssh\administrators_authorized_keys -Value '''$authorizedKey''';icacls.exe ""$env:ProgramData\ssh\administrators_authorized_keys"" /inheritance:r /grant ""Administrators:F"" /grant ""SYSTEM:F"""

# Connect to your server and run the PowerShell command by using the $remotePowerShell variable.
ssh username@domain1@contoso.com $remotePowershell
```

And then for actually getting this to look like a thing that might be good and useful, we miiiiight be able to use the instructions in the 'use existing devcontainers.json' part of this document:`https://code.visualstudio.com/remote/advancedcontainers/develop-remote-host`

### Workspaces

Seems to me that in and around the easiest way to manage most of this stuff is through Workspaces. Obvs, if you could just attach cloned containers as volumes, that would be even better. But there are restrictions on that which is real annoying.
