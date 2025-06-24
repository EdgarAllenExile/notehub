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
