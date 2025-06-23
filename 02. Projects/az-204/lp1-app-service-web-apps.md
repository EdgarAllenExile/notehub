# Implement Azure App Service Web Apps

## Explore Azure App Service 

Benefits:

- Auto Scaling
    - RAM, COREs
- Containers, multicontainers, docker compose and Windows Containers
- Slots
- linux Apps
    - Allows for the running of custom linux containers, nown as Web App for Containers
    - Some limitaitons of linux app services
        - no shared pricing
        - slightly more limited feature set
        - Higher disk latency, since built in images use higher latency storage containers than the custom ones
- Can deploy custom containers, cusing custom images
    - check what is supported using `az webapp list-runtimes --os-type linux`
- App Service Environment
    - Fully isolated and dedicated environment offering higher security
    - Fully dedicated compute resources

## App Service Plans

Apps run in app service plans. This defines a set of compute resources used to run. These can be used by multiple plans.

When you create an ASP, you specify:

- OS
- Region
- No. VMS
- VM size
- Pricing tier

Each app within the ASP uses these same sets of resources.

### Pricing Tier

Shared Compute - Free and Shared

- Shared compute, shares resouces with other customers
- Dedicated compute, dedicated vms
- Isolated compute, resources that are isolated within dedicated Azure Virtual Networks. Provides network isolation and compute isolation as well as max scalability.

### Scaling and Running

Free and shared tiers, have everything on the same vms. This means you can think of the ASP as the scale unit of the ASP. If the plan is configured to run five VMs, then all of those apps run on five instances. If the ASP is set to auto scale, then all of the apps are auto scaled together.

You can move around the apps between tiers such as isolating the compute resources and moving the app into an isolated ASP.

Suggested to isolate apps into new ASPs when:

- App is resource intensive
- You want it to scale independantly of other apps
- Geo concerns

## Deploying to an App Service

You can auto deploy using Azure, GH or BitBucket.

You can manual deploy using Git, CLI, Zip deploy (curl) or FTPS

If using containers or similar, deploying using staging slots can be more complicated.

This is because of the need to deploy first to the container registry. Suggeted to build and tag the image, push the tagged image to the registry, then update the slot config to use the new image.

If you are using containers, you can side car microservice containers such as monitoring, logging, config and network services. This lets you add extra features without updating the image.

## Authentication and Authorisation

MS offers a variety of App service auth providers.

Auth flow in these situations can be either with or without the auth provider's SDK.

Wihtout SDK, the app delegates federated sign in to the App Service. This is typically done using browser log in and is called server directed flow or server flow.

With SDK, the auth signs in the user and then sends that token to the app service. This is called client or client directed flow. This is how REST APIs, Azure Functions, JS clients and native mobile apps work.

There's a nice auth flow diagram available here.

Apps can either allow unauthed requrests or require authentication.

App services also provide a nice built in token store.

Logging and tracing is automatically provided if you enable application logging.

## App Service Networking features

By default, App Service Apps are accessible through the internet. There are two main deployment types:

- Multi Tenanted APS
- Single tenant ASEs, hosted directly in the Azure Virtual Network.

### Multi Tenant App Service networking features

An app service is a distrubuted system, with front ends handling requests, workers handling customer work loads and the app service network connecting the two. This network is off limits for direct connectoin because many different customers may use the same App Service Sacle Unit. 

Since you can't connect to them, features handle parts of app communication. Features include Addresses, service / private endpoints, hybrid connections, gateways andvirtual network integrations.

Addresses and endpoints are for INBOUND TRAFFIC, where as hybrid connectoins, gateways and virtual network integrations are for OUTBOUND TAFFIC.

## Networking behaviour

Basic ASPs use one worker. If your plan is scaled out, then that plan is replicated on a new worker.

Different types of worker VMs are used by different pricing tier. This VM family offers a different set of outbound addresses. 

Each outbound address can be found in the properties of the app.

# Configure Web App Settings

Settings are injected to App Services through Env vars at start up. Editing these settings triggers an App restart.

App Settings are encrypted at rest. They cannot contain special chars other than . and _, unless escaped using target OS 

For Linux apps, json key structure has the : replaced by __ and periods replaced by _

You can configure things to be slot setting specific but adding `slotSetting:false` to the json object

At runtime, connection strings passed as ENV Vars are prefixed with a DB relevant DBCONNSTR_ string?

you can also pass contianers these things, but who could be bothered.

## Available settings

General Settings -> Stack settings, lets you specify language and SDK versions

Platform settings allow you to specify 32/64 bit, FTP state, HTTP version, Web Sockets, Always On status, ARR Affinity, HTTPs only and TLS version

Deugging and client certs for mutual auth

## Path Mapping

Within config > Path mapping you can configure path mapping such as IIS handler, vitrual applicatoin and directory mapping

### Windows Apps

Handler mappings let you add custom script processors to handle requests for specific file extensions

Adding a new handler mapping requires the file extension to handle, the script to run (absolute path) andthe arguments to pass to the script

Each root is mapped to `D:\home\site\wwwroot` which is where code is deployed by default. If you have multiple apps in the same repository, you can add virtual apps and directories.

This is done by specifying each virtual dir and corrasponding path relative to `D:\home`. Clearing the Directory checkbox will mark the virtual directory as a web application.

### Linux and containers

Adding New Azure Storage Mount lets you configure your custom storage. This includes name, config options, storage accounts to bind, storage types such as blob or azure files, containers, share, key as required, mount path to attachto and the deployment slot settings.

## Diagnostic Logging

There are built in optoins to enable logging and diagnostics.

- Application Logging
    - Available on windows and linux
    - Saves to file system or blob storage
    - Records log messages generally produced by app code
- Web server logging
    - Windows
    - Saves to file system or blob storage
    - Raw HTTP requests
- Detailed error message
    - Windows
    - App service file system
    - .html error pages sent to the client browser
- Failed tracing request
    - Windows
    - App service file system
    - Detailed tracing information 
- Deployment logs
    - Windows and linux
    - File system
    - Helps determine why deployments fail

### How to Enable Logs

App Service Logs -> turn on -> Either filesystem or blob. Blog is for long term, file system turns itself off after 12 hours. Level does what you would expect.

Stream logs go to different places that no one cares about

### Accessing Log Files

You must use a client tool that works with Azure storage to read these logs. 

they are at api/ump

in linux or container apps, a zip file contains the console output for both the host and the contianer. 

## Security Certificates

Certs uploaded  to an app are stored in the deployment unit that is bound to an apps resources group and region combination, called a webspace. This cert is accessible to other apps in the same webspace. 

There are several requirements to use a private cert in an pp service. If needed, suggest going and finding that.

Free app service managed certificates are a turn key solution for securing DNS name in the app service. Auto renewed and canbe bound to the custom domain. There are also limitation and other parts of this that are probably important.

## Examine Scale out options

You can scale things manually, or automatically using Azure Auto Scale (based on rules you define) or Automatic Scaling (based on parameters you set).

### Autoscale vs Automatic Scaling

#### Autoscaling
Autoscaling increases resources based on current demand. Scales 'in and out' as opposed to up and down. 

Can be done based on a variety of factors. Characteristics include:

- Standard tiers and up
- Rule or schedule based 
- runs on other instances that are available

Should consider auto scaling to provide elasticity for a service. 

It works by providing additional web servers, as such it might not be applicable to resource intensive sites. Generally preferred to manually scale in those situations.

Generally do not use for long term growth options. This is because of the overhead required with monitoring autoscaling.

#### Automatic Scaling
Automatic Scaling:

- Only Premium and Up
- Based on http traffic
- No Schedule
- Always ready or prewarmed instances available

### Auto Scaling

There are two available conditions to determine auto scaling. Scaling based on a metric (disk queue, http requests etc) and scaling based on a schedule.

You can combine these in different ways to allow for progressive scaling and rule changes. Schedule for a certain time and then incorporate metrics or vise versa.

Metrics that autoscaling can use are as follows:
- CPU Percentage
- Memory Percentage
- Disk queue length
- http queue length
- data in / data out

### Rules for Autoscaling

In general, metrics are analysed in one minute increments (time grains). This is a form of time aggregation.

This can be further aggregated by the use of a duration (a user set time) that will further determine if scaling is required. These can be used with different aggregation, for example, the duration can look at the average determined for the percentage utilisation at each time interval.

### Autoscale actions

Actions are either scale in or scale out, meaning either increase or decrease the number of instances available. These rules are subject to cool downs follwing the action so they don't increase massively.

Generally these actions should be taken in pairs, a scaleout action for increased usage and a scalein action for decreased.

Actions can be proportionate to the same condition, or they can b e seperate. i.e. you can increase and decrease by the same metric, or they can each be depednant on any variety of conditions.


