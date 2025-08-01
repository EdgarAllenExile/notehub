# Practice Questions 

Why on earth are there so many things to know about Azure Cosmos Db??

## Practice Exams Thoughts on Correct Answers

- Just read through the Command Line Questions, they probably make sense
- Scaling Up is going up tiers, scaling out is increasing instances
- Timer Triggers in functions look like this: Run([TimerTrigger("0 */15 * * * 1-5")])
    - This will execute the function every 15m monthay through Friday
- If you are sharing file share between containers, use a container group
- When deploying a file share to a container instance, use the ARM template
- If you are sharing a container registry across multiple groups in a company, and you need isolation, use namespaces
- If you are rate limiting functions, set a DynamicThrottleEnabled in the host.json file
- Write is the BlobSasPerm enum to set to Upsert
- User Delegation is used if you need Entra secured, RBAC applicable SAS token access granting for containers
- Data Cache loads info into the cache from a database
- Connection multiplexer is the thing that gets the getdatabase name in the redis namespace
- Preaggregated standard metrics do not increase telemetry volume
- Change Feed Processor lib and CosmosDB trigger let you push info and read changes
- Consistent Prefix ensures that operations in the same batch are visible together
- You Configure an APIM Policy to rate limit calls from a single source
- the : character lets you define and set namespaces for keys in a KV
- Enabling CORS on the CLI is actually just as simple as az webapp cors add
- If you want to read an item from a cosmos db you must supply the id and partition key
- Dedicated name spaces for each event hubs tenant offers the highest data and performance isolation in multi tenant environments
- you grant app permissions to access graph in a multi tenant application
    - This is because an App is a singular Entra ID app in a single Tenant, hence the app needs the permissions.
    - This includes situations in which you use multiple tenants, presumably the app exists in a home tenant, thus has one app object.
- Blob containers hold SAS access. The service can access the keys but cannot access policies, same as the storage access.
- When it comes to managed identity
    - it is user managed requires user rotated secrets
    - Service principal and cert requires manual rotation of the cert
    - Service principal and secret also needs to rotate the secret which can be annoying.
- Restart OnFailure does what you think it should in Container instances yaml files
- Container apps let you run general purpose containers and make micro services, it differs from container instances which do not support scaling, load balancing or revisions
- If you're setitng key expiry, first use a string for the time in seconds, then chuck in a TimeSpan.FromSeconds in there for good measure.
- When you are doing APIM access, you define a subscription for devs to subscribe to and then a product to scope that subscription to. That lets your devs subscribe to the subscription and their access will be scoped to that product.
- if you're doing APIM header manipulation, then inbound is for incoming calls, backend is for manip and outbound is for forwarding them on. You use them in that order if you need to alter things.
- ON APIM, if you want to adjust how APIs function, you use policies, this is what I described above.
- Container Groups are collections of containers that get scheduled on the host machine. 
- namespaces in containers let you isolate things across repository
    - Interestingly, the repository is the part of an ACR that reprents a collection of container images or artifacts that have the smae name but different tags (versions) tags specify the version you want to use of that image
- Blobs are still the only thing that supports user delegated SAS within a storage account
- Why do you define meta data with a PUT and not a POST

## Incorrect Answers & Explanations

Turning on Local Cache within a web service
- LOCAL_CACHE_OPTION should be ALWAYS
- AMOUNT_IN_MB should be amount in mbs

Loading TLS/SSL Certs in Application Code
- The correct app setting is WEBSITE_LOAD_CERTIFICATES

When referencing App service settings and accessing secrets
- SecretName; VaultName

When creating C#, script based Azure Functions
- Create function.json files for each function to configure the triggers and bindings
    - You cannot use decorations in this instance as it is a script based function

If you are accessing user information using GRAPH, then you want to give the app service 
- Delegated permissions, this is becasue the app does have a signed in user present. If it was just a deamon or similar you could just App Permissions

User delegated shared access signatures
- Can only be used by blob storage

Shared Access Signature to give READ access to a blob storage 
- Needs credentials with the Contributor Role

User Assigned managed identities
- Should be used in situations that you have several apps that all need to access a common config

Accessing Secrets in a key vault
- Via CLI is done by SHOW then --NAME then --Vault-Name

Redis Modules for Azure Cache
- only Supported in enterprise tiers

Setting duration in CLI
- Probably want timespan.FromSeconds(10)

Reading from CosmosDB
- Eventual consistency has the highest availability but no ordering
- Strong is orderd, boundless is lower availability
- Session is monotonic reads, but no guarentee if value read is last value written

Blob prefix strings
- First element should be the container name

Append Blobs
- Can only be deleted and do not support scale out

HTTP Properties in Azure Blob Storage
- ETAG and Last-Modified are the only two that are available

Self hosted Gate ways
- SHould use 1.0.0 form image

Aure Event Hubs
- Can stream to Blob storage and both data lake versions

Azure Funtions
- Only Consumption model allows for serverless pricing model

App Service Certificates
- Free certs are good, but cannot be exported
- Paid App Service Certs can be exported and are good

If you are dealing with rate limited APIs to call
- Set both of the concurrent and outstanding app settings

A lease container should be used to manage state and act as a change feed processor

If you are recording meta data, use a PUT request

Obviously use the advanced filtering options if you want the advanced filtering

Messaging Sessions guarentee FIFO message processing

When configuring APIM, you must pase the base element if you want to be able to enforce an evaluation order

System Assigned Managed Identity will ensure that resources can access each other and that one will be deleted when the other is

If you need Function Apps to avoid cold starts, then you must usethe premium plan.

If you want to review a web app logs for 400 code errors above 400, then you must use the detailed errors log.

Scaling a functions app can be limited using functoinAppScaleLimit property
- if so, consider setting it to approx 10. Default is 200 and this will allow you to control scaling.

If you're starting up a container app and want to specify the image, use:
- az containerapp up --source ....

If you want to restrict access using APIM, then it's likely that you should cerate a new subscripiotn with product scope.

I know I have added this, but if you are enforcing policy order in APIM, you use the BASE Element.

Always use the staging slots
- Especially if you want to minimise locked files

Rate throttling
- If you want to throttle for  a third party service, use maxConcurrentRequests and maxOutstandingRequests
- dynamicThrottlesEnabled will only work for internal throttling based on system performance indicators

App Insights Slow Response Time
- You want to set App Insights web tests and alerts, which mock user interaction and respond
- You don't want Resource Health alert because that's for infra issues
- Nor service health or advisor alerts because that's for MS updates and best practice respectively

If you want to do meta data for photos, use a PUT request because that updates existing blobs;.

Azure Cache for Redis -> If you want data loss prevention, low storage cost and optimised performance you should use a redis db with soft delete off. This is because RDB persistence backups have minimal impact on performance and the disabiling of soft delete means that redis can minimize storage costs by removing old data.

Just look for StringSet in the big old CLI command questions.

If you are self hosting a gateway or really any Azure container, you should use the three digit version number. 

if you need FIFO ini your azure storage bus, then you are looking for message sessions. This enables you to enable exclusive ordered handling of messages.

Creating a blank APIM instance allows for precise controls over access, this can be further adjusted via jwt validation and rate limiting which enhances security and performance. 

If you have IOT network with thicc throughput then you want an event hub. it is optimised for large volumes of realtime events being ingested.
    - Conversely, Event Grid is for routing and serverless applications, service bus is for messaging patterns.

WHY IS EVENTUAL THE MAX THROUGHPUT. It is because you forgot how to think about it. FIFO on one end, throughput on the other. Strong is FIFO, Eventual is throughput.
- Eventual because it doesn't care, then bounded because it mostly doesn't care, then session because it only cares about the batch, then bounded but that probably depends on what you send and then Strong, because it does care.
    - I accidently really like the caring thing. Bounded staleness cares about it, session kinda does, strong really does etc.
    - Still not 100% on session vs prefix.
    - Session is monotonic
    - Bounded staleness is additional to consistent prefix because bounded stalenes is also bound by the staleness requirements.

If you are setting up storage policy for blobs you need to know about prefix match filter, which starts with a container name.

The service principal associated with an app cannot be explicitly deleted when you are ysing syste-assigned identity. It is deleted when you delete the resource.

if you have a multi instance app service and you want to route a client to the same instance all of the time, you use AAR Affinity

If you are adding partitions to an event hub, you use flags like you normally fucking would, --apartition-group 12, you also don't need to worry about the consumer-group because we aren't at that stage yet.

You can filter service bus topics via SQL, which I do think I knew
