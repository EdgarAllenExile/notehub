# Usecase for Each Major Feature


App Services
 - Sort of swiss army knife of hosting platforms, allowing straight up apps to be deployed to it but also function apps nd containers.

App Service Environment
- ASE is an isolated and dedicated environment for running apps hosted on app services.
- ASEs run in the single tenant isolated pricing tier.

App Service Tiers
- Shared Compute, free and standard, for dev and testing share resources between other app services.
- dedicated compute, basic, standard, premiumv1-3 lets you run on dedicated vms.
- Isolated, isolated v1-2, dedicated network etc.

Azure Functions
- Serverless job doers written in script language. Auto scales and pay per use pricing.
- More integration than web jobs or logic apps
- All functions have a 30s timeout generally

Azure Logic Apps
- Also function doers however are written using a GUI and are  closer to automate scripts

Function Tiers
- Consumption, no containers, generally available, 5 or 30s timeout
- Flex, similar but scales better
- Premium, functions run continuiously, and you need more grunt, or want linux images
- Dedicated plan, run functions within app services, can also take advantage of ASE
- Container Apps, you can also containerise your functions and run them in container apps, this is closer to hosting an actual container and is generally for micro services

Blob Storage
- Blob storage (live in storage accounts) stores unstructured data, can be either standard or premium (solid state drives, blobk blobs, page blobs or file shares)
- Storage Account -> Containers -> Blobs (block / append / page)

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

Container Instances

Container Registry

Container Apps

User Managed Identity

System Managed Identity

SAS Tokens

APIM

Event Hub

Service Bus

Storage Queue

App Insights


