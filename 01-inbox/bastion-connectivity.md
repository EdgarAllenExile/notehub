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
