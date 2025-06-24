# Azure Functions

## Intro

Azure Functions are:

- Serverless
- They support triggers and bindings
- Define inputs, actions, conditions nad oututs

## Orchestrations

Both logic apps and functions are 'orchestrations' or a colletion of steps used to execute a task.

Functions are code driven, where as logic apps are GUI driven.

Functions are built on th Web Jobs SDK and thus share similarities. The distinguishing characteristics are their portability and ease of use. Webjobs are not serverless, they are in the CLI and they do not integrate with logic apps (apparently).

## Hosting Options

Functions are facilitated by VMs hosted in AS infrastructure. This includes the same level of config in a regular app service. 

### Plans

Consumption plans allow for you to only pay when used.

Flex consumption plans are slightly better, with instances being added or removed based on configuration and use. 

Premium plans let you use prewarmed workers, no idle delay, more grunt and connet to virtual networks. You may want this if you have specialilsed needs.

Dedicated plans are for long running scenarios when durable functions cannot be used. 

Container apps are more substantial and let you integrate your functions into a microservice environment. This includes packaging with rolled libs, migrating into cloud, avoid k8s and dedicatd / highent compute

Different plans give you different levels of time out limit. Starting at 5m for consumption plans and generally going up to 30 for the others

### Scaling functions

Functions can scale based on a variety of plan based factors.

Consumption driven scaling is event driven, scales CPU and memory by increasing instances based on triggers. You can have 200/100 Windows/Linux instances.

Flex plans have per-function scaling. More deterministic in this way to regular consumption. Not instance limited, but are resource limited.

Premium plans scale based on events and triggers. 100/20-100 windows/linux (region specific).

Dedicated Plans are manual or autoscaled as required. 10-30 or 100 in an ASE.

Container apps are scaled out automatically by adding more instances of the host. You can have 10-300, provided you have enough cores to host.

## Function Apps

Function Apps are the unit of measurement within which you house functions. 

### Local Compilation

Regardless of language, you will have a host.json file, a local.settings.json file and your logic.

Host file is a host file, must be the same across functions within the same function app.

Easiest way to debug these sorts of things when building locally, is to just hook up your locally built function to a live Azure service 

For storage based triggers, you can use Azurite emilator to test functions relating to Azure Stroage (blob, queues, tables)

You can also use administrator endopoints to trigger non-http endpoints

### Triggers & Bindings

Triggers and bindings let you avoid hard cloding references, as you can simply join things together. You can use triggers for example, ingest the content of a message and then send that data by using the return value of the funtion

You can configure tiggers and bindings depending on which language you use. Generally used by decorating methods, sing params or java annotations. If you are using a scripting language then it's jst updating the function.json schema.

Parameter types define input data type.

#### Triggers

Triggers start the function

They can only be bound inwards

#### Bindings

Bindings can be input or output bindings and generally pipe things between services

Can bind in and out. Also have special unidirectional inout bindings, which lives in the advanced editor within the integrate tab.

## Connecting to An Azure Service

App settings are stored within a function in name value pairs. These are encrypted and can be accessed at run time. 

If you are using a connection string, you can also access that string via using the app settings name, which is nice.

### Identity

Some connections in Azure funtions use identity as opposed to a secret. Support for this is spotty and probably should just be reviewed on a case by case basis

That said, when it works, you use managed identity to congigure them. This is assigned by the system and can be specified with credential and client id properties as needed. 

You must grant these identities permissions in azure RBAC as required though

Nine more learning paths to go!
