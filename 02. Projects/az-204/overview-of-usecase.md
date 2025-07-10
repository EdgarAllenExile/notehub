# Usecase for Each Major Feature

App Services
 - Sort of swiss army knife of hosting platforms, allowing straight up apps to be deployed to it but also function apps nd containers
 - An App service is the PaaS equivalent of Az vms which are IaaS

## App Service Tiers
- Shared Compute, free and standard, for dev and testing share resources between other app services.
- dedicated compute, basic, standard, premiumv1-3 lets you run on dedicated vms.
- Isolated, isolated v1-2, dedicated network etc.

App Service Environment
- ASE is an isolated and dedicated environment for running apps hosted on app services
- ASEs run in the single tenant isolated pricing tier
- ASE == isolated

App Service Plan
- You should consider sticking things in an app service plan when you want to house a bunch of shit together
- This includes fucntion apps, which can be beneficial if you want predictable billing, larger compute or ASE support
- An ASP is a shared-multiservice env, whilst ASEs are isolated and dedicated shared envs

Azure Functions
- Serverless job doers written in script language. Auto scales and pay per use pricing.
- More integration than web jobs or logic apps
- All functions have a 30s timeout generally
- Functions can be self managed in premium tier and above if you need Linux containers
- No Cold starts is premium and above
- Once you start getting into large orchestratoins, you can consider durable functions, which let you write stateful functions in a serverless compute env

Azure Logic Apps
- Also function doers however are written using a GUI and are closer to automate scripts
- Advantage being that they integrate better and differently to Function Apps, also aimed at non-traditional devs I think

Function Tiers
- Consumption, no containers, generally available, 5 or 30s timeout
- Flex, similar but scales better
- Premium, functions run continuiously, and you need more grunt, or want linux images
- Dedicated plan, run functions within app services, can also take advantage of ASE
- Container Apps, you can also containerise your functions and run them in container apps, this is closer to hosting an actual container and is generally for micro services

## HTTP Headers
- CONTAINERS only let you have the two headers, blobs themselves have a whole bunch
- There is actually a whole bunch of HTTP header related things that I should learn

Blob Storage
- Blob storage (live in containers and then storage accounts) store unstructured data, can be either standard or premium (solid state drives, blobk blobs, page blobs or file shares)
- Storage Account -> Containers -> Blobs (block / append / page)
- Blob encryption can be either v1 or v2
    - v1 uses GCM mode with AES, can be used for all types
    - v2 uses CBC with AES, can only be used with blob and que storage

Blob Storage Tiers
- Standard or General Purpose, which lets you store everything
- Premium Blobs, for blob storage, high transaction rates
- Premium File Sheets, for file storage, enterprise or high scale apps
- Premium page blobs, for blobs

Blob Access Tiers
- Hot, high storage costs / low access costs
- Cool, Min storage of 30 days
- Cold, 90 days min storage
- Archive, 180 days can take like 15hrs

## CosmosDb
- Cosmos DB is obviously noSQL db
- Consistency Levels:
    - Strong
    - Session
    - Consistent Prefix
    - Bounded Staleness
    - Event

CosmosDB triggers
- Pretriggers let you perform actions before they are added to the db, this includes adding a ts
    - They cannot take inputs
- Post-triggers let you perform actions after a thing, generally include meta data updating
    - They run as part of the transaction and will cancel it if they fail
- The answer to this question could definitely just be use a function
    - From there your host instance, will do some amount of reading the feed, sleeping sending them to the delegate and then process them

CosmosDB Change Feed
- Kinda like an event hub on its own, the change feed lets you monitor changes to the DB
- You can either push it or pull it, most of the time you wnat to use the push model
- Monitor the change feed with either a fucntion or the change feed process lib
    - Change feed library has the four components, monitor, lease, delegate and compute

Container Instances
- Container instances are when you want isolated simple operations such as build jobs and automations
- Container instances are fast, easy to access, secure and persistant. They can run both Linux and Windows images

## Container Groups
- Container instances live in container groups, which allows them to share storage and networking without mounting it as explicitly
- I think these are effectively docker compose scripts
- Can you have container app groups?

Container Registry
- DIY Docker Hub, where you store the images that you would like to use in your containers

Container Apps
- Container Apps are closer to functions than dedicated container instances
- As a result, you can actually host your functions on container apps if you want to include custom libs, migrate them or want to offshore your grunt / overhead

Service Principal
- A service principal is the represetation of an application in the Identity platform
- This can be an application on its own, a managed identity or a legacy app
- Whilst an app object represents the app in its entirety, the service principal is how that app is represented in each specific tenant in which it exists
- It is the incarnation of the app for the purpose of authenticating, and interacting with other Azure service

MS Graph
- Graph can be used to query just about anything
- Remember to use principals of least access. Only grant perms that are required and no more
- If you have an interactive app, use delegated perms, if you have an app to app, use app perms

User Managed Identity
- Creates a standalone Azure Resource, which is then assinged to an Azure service instance
- Lives and dies with whatever it has been assigned to
- Generally used for when multiple things want to use that identity, such as an app that runs on multiple vms
- Also inludes when workloads need to be pre authed or the underlying resources are cycled frequently

System Managed Identity
- Azure creates the identity for you, with credentials being assigned to that resource
- If underlying resource is deleted, identity is deleted
- Generally used for workloads within a single az resource, or if you need independant identities, such as an app that runs on a single vm

## SAS Tokens
- Shared Access Signatures are signed URIs that include tokens and contain query params. There are user delegated (on bealf of the user), service delegated (for use with a storage account) and account sas (for use with storage account service level)
- User a SAS when clients do not have their own permissions to access your services, such as file storage 
- Also used to move blobs around or to copy files to blobs or files to different storage accounts

APIM
- Mangement utilities for APIs, comprised of three major components, API Gateway (send and recieve calls), management plane (provision services, do scheme things, restrict access) and developer portal (Read doco, generate API keys)

APIM Gateways
- The gateway is the outwardly facing portion of APIM. It handles proxying services, routing requests and misc tasks such as auths and rate limiting
- Advantages of a gateway are that you can keep things simple and decoupled, using a single point of contact between users and services exposed on possibly publicly facing endpoints over a nice protocol such as HTTP or Web Socket

APIM Policies
- APIM policies are written in xml, and can be inbound, backend, outbound or on-error
- They can even filter CORS responses and things of the like
- Advanded policies include, logic flows, return resonses, logging ot event hubs, retry poicies, mocked responses, limit concurrency and forward requests

APIM Subscriptions
- Generally, APIs are secured via subscription. That is, your clients get a subscription, which is a private key and a public key, they use that to verify (via adding to http header) and they're away

Event Hub
- Event hub is a native data streaming service that can ingest and store streaming data and use real time analytics
- Analytics are usually done with like Azure Stream analytics and the cute ittle no code editor

Event Grid
- Pub Sub message distribution ideally focused on platform integration and IoT devices
- Topics and subs like a bus, but also system topics (built in) and then partner topics
- Can be both synch and asnch depending on requirements, can include liasing with logic apps, functions and automations

Event Filtering
- You can filter by success or failure or status code, and then also the subject

Service Bus
- Use a service bus when you need FIFO and duplicate guarantee
- Message processing in long running streams, with several nodes processing
- Comes in basic (dev), standard and premium. You probably want premium

Storage Queue
- Use a queue when you want to track message processing, large volume of messages or write logs to the server
- Queues live in your storage accounts

App Insights
- App insights is a logging and telemetry service to monitor your application. You can stick it in at run time, dev time, mobile usage or even just availability tests
- If you're looking to test your api using app insights, you probably want the standard test, if you want to get fancy with it you can use a custom tackavailability test or you can use the classic URL ping test.

App Insight Metrics
- You can use either log metrics, which are collected on the go by the app and provide detailed overview or standard metrics which are preaggregated by Azure and allow for good querying.
- If you're calling the logger that's log basd metrics, if you are just looking at live metrics, those are preaggregated.

Key Vault
- KVS solve three main problems, secret management (inc tokens, passwords, certs, keys), secret management (public and private encryption keys) and certificate management (store full on SSL/TLS certs)
- Can be standard or premium, with premium basically giving you hardware backed keys
- General usecase is for centralising, securing and managing your app secrets

App Config
- App config allows you to centralise and control access to your app's configuration information
- If you want to manage your own app config and keys, then you need to be at least standard tier, have an AZ KVs with soft delete and purge protectoin enabled and have RSA or HSM kes withou the key vault
    - From there just assign a managed identity to that instance and grant that identity the GET WRAP and UNWRAP perms
