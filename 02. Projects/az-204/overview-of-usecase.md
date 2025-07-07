# Usecase for Each Major Feature

App Services
 - Sort of swiss army knife of hosting platforms, allowing straight up apps to be deployed to it but also function apps nd containers.

App Service Environment
- ASE is an isolated and dedicated environment for running apps hosted on app services.
- ASEs run in the single tenant isolated pricing tier.
- ASE == isolated

App Service Tiers
- Shared Compute, free and standard, for dev and testing share resources between other app services.
- dedicated compute, basic, standard, premiumv1-3 lets you run on dedicated vms.
- Isolated, isolated v1-2, dedicated network etc.

App Service Plan
- You should consider sticking things in an app service plan when you want to house a bunch of shit together
- This includes fucntion apps, which can be beneficial if you want predictable billing, larger compute or ASE support

Azure Functions
- Serverless job doers written in script language. Auto scales and pay per use pricing.
- More integration than web jobs or logic apps
- All functions have a 30s timeout generally
- Functions can be self managed in premium tier and above if you need Linux containers
- No Cold starts is premium and above
- Once you start getting into large orchestratoins, you can consider durable functions, which let you write stateful functions in a serverless compute env

Azure Logic Apps
- Also function doers however are written using a GUI and are  closer to automate scripts

Function Tiers
- Consumption, no containers, generally available, 5 or 30s timeout
- Flex, similar but scales better
- Premium, functions run continuiously, and you need more grunt, or want linux images
- Dedicated plan, run functions within app services, can also take advantage of ASE
- Container Apps, you can also containerise your functions and run them in container apps, this is closer to hosting an actual container and is generally for micro services

HTTP Headers
- CONTAINERS only let you have the two headers, blobs themselves have a whole bunch

Blob Storage
- Blob storage (live in storage accounts) stores unstructured data, can be either standard or premium (solid state drives, blobk blobs, page blobs or file shares)
- Storage Account -> Containers -> Blobs (block / append / page)
- Blob encryptoin can be either v1 or v2
    - v1 uses GCM mode with AES, can be used for all types
    - v2 uses CBC , can only be used with blob and que storage

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

CosmosBD
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

CosmosDB Change Feed
- Kinda like an event hub on its own, the change feed lets you monitor changes to the DB
- You can either push it or pull it, most of the time you wnat to use the push model
- Monitor the change feed with either a fucntion or the change feed process lib
    - Change feed library has the four components, monitor, lease, delegate and compute

Container Instances
- Container instances are when you want isolated simple operations such as build jobs and automations
- Container instances are fast, easy to access, secure and persistant. They can run both Linux and Windows images

Container Groups
- Container instances live in container groups
- I think these are effectively docker compose scripts

Container Registry

Container Apps
- Container Apps are closer to functions than dedicated container instances
- As a result, you can actually host your functions on container apps if you want to include custom libs, migrate them or want to offshore your grunt / overhead

Service Principal
- A service principal is the represetation of an application in the Identity platform
- This can be an application on its own, a managed identity or a legacy app
- Whilst an app object represents the app in its entirety, the service principal is how that app is represented in each specific tenant in which it exists

MS Graph
- Graph can be used to query just about anything
- Remember to use principals of least access. Only grant perms that are required and no more
- If you have an interactive app, use delegated perms, if you have an app to app, use app perms

User Managed Identity

System Managed Identity

SAS Tokens
- Shared Access Signatures are signed URIs that include tokens and contain query params. There are user delegated (on bealf of the user), service delegated (for use with a storage account) and account sas (for use with storage account service level)
- User a SAS when clients do not have their own permissions to access your services, such as file storage 
- Also used to move blobs around or to copy files to blobs or files to different storage accounts

APIM

Event Hub

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


