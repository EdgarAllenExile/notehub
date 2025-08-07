# Dev Containers

## Current

Currently I have this working quite nicely using a pretty rudimentry dev container set up through vs code, nb this is only really local set up 

I also have a pretty decent grasp on the different ways to use Azure Bastion to connect to these things. Notes on that:

- You ssh into the machine using a tunnel first, then effectively ssh'ing to the local host.
- I assume that I will be able to use docker contexts to effectively set the build machine as the docker host, via a bastion tunnel

## To Explore

Things to look at from here, would be how to get the local set up onto the remote server in a useful way. Currently thinking that I will install docker on the remote machine, spin up a bastion tunnel and use docker context to connect to it.
