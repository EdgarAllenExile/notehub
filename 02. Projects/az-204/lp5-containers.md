# Containers

Azure Container Registry based on Docker Registry 2.0.

You can pull images from a registry to a variety of targets. Also you can push things to the registry.

## Service Tiers

Basic standard and premium. Basic is for students, standard is increased storage and throughput (good for most prod scenarios) and premium is the highest spec optoin for high volume ops. Includes geo replication and private links.

## Storage

Container Registry benefits from the fancy Azure storage features:

- Encryption at rest
- Regional storage
- Geo-Replication
- Zone redundancy
- Scalable Storage

## Tasks

Tasks let you do a variety of things:

- Quick task, build and push an image to an on demand registry
    - docker build & push
- Automatically triggered tasks, build images after an update
    - Can update on source code update or schedule
- Multi step task, which includes things like building the app then running the container, then building the tests, then running the test container, then upgrade the chart image, then deploy

## Dockerfile

Dockerfiles are scripts that contain a series of instructions used to build docker images. This will usually include the following:

- Base image
- Command to update the base os
- Build artifacts to include
- Services to expose, such as storage and network
- run command

### Creating a docker file

Components of the docker file:

- FROM runetime
    - Sets the base image to to the .net runtime
- WORKDIR /app
    - Sets the working dir to /app
- COPY bin/release
    - Copies the content of the published app to the container's app reg
- EXPOSE 80
    - Expses port 80
- CMD dotnet, mydll
    - the command to run the container

# Container Instances

Container instances are useful for single purpose jobs that can include simple apps, automated tasks and build jobs.

You might use a container for the following reasons:

- Fast startup, since they start much faster than VMs
- Container access, since you can exose container groups to the internet
- Hypervisor level security, since you can totally isolate the apps
- Customer data, is stored at a minimum
- Custom sizes, the right tool for any job
- Persistant storage, mount file shares to any container
- Both linux and Windows images available! 

## container Groups

Containers live in groups, which are a collection of containters that are scheduled on the same host machine. These containers share a lifecycle, local network, resources and storage volumes.

Is a container group the same as a docker compose file?

Multi-Container groups can be deployed in two ways, ARM templates or YAML files. MS recommends using ARM if you are deploying multiple things at once and YAML when only deploying contianer instances.

Resources are aloocated to containter groups by adding the resource requests to the instnces of in the group. This means that if you have a container group, with multiple container instances, each instance that makes a request is filled seperately.

Container groups share IP addresses and ports on that address. These ports must be exposed if you wish to enable external connectivity. Since they share a port namespace, port mapping is not supported. 

Intra-group connections though are supported via local host.

You can mount volumes to containers pretty simply. These can be from a variety of sources such as Azure file shares, Secrets, Empty directories and git repos.

### Use cases

Generally suggested to use multicontianer groups when you want to split up a single functin into a few container images. This would be one container hosting a site and another acting as the CMS. It could also be a container and a logging or monitoring container. The ubiquitous example would also be a front end and a back end container.

## Single Instance Tasks (Containers with restart policies)

Containers are good for run once tasks, suchas build, test or image rendering tasks.

Containers can be set to stop when the process is complete. This is good because containers are billed by the second, so you are only charged for the compute resources used whilst the task is running. This is why SILVA HUB streamsuse containers and why they die when finished. 

You can specify the restart policy when creating a container instance. It can be Always, Never or OnFailure.

You pass this in the standard az container create command, using the double dash restart-policy parameter.

## Environment Variables

Setting Env vars in container instances allows you to dynamically provide config to the container. This is similar to the environment param passed to a docker run command.

These can be passed as secure values in both linux and windows if you're passing secrets. These secure variables are not visible in container properties and can only be accessed within that container. If you're looking in from the portal, you only see the secret name, not the value.

To pass this to the container, pass in 'secureValue' not just value. Using docker componse or Azure yaml, it'd be like - name: name -secureValue: value.

## Storage / File Shares

Containers are stateless. Once your container dies, that data is lost.

This is of course, unless you persist that information within a file share. Azure file shares are done through SMB protocol and act similarly to how file shares work on vms.

You can only mount file shares to linux containers, the container must run as root and they are limited to CIFS support. Not that I remember what that is.

You do this like how you do it with Docker Compose. Volumes: name: azureFile: shareName storageAccountName: storageAccountKey:

You can also mount multiple volumes. This is done through ARM templates or yaml files. 

But you can't just daisy chain these things together. A volumes property must be set, which ocontains the volumes array and then attached to the containers using the properties section. 

# Container Apps

Container Apps  are serverless container services that support microservice aps and autoscaling, but nicely and easily.

Uses for this sort of a tool include:

- API endpoints
- background processes
- event driven processing
- microservices


