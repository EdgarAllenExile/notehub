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
