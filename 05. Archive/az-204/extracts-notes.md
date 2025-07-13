# Code Snippets

## APIM Control Flows

```<choose>
    <when condition="boolean expression">
        logic to apply
```

You can then slot in an `otherwise` as you need.

Other things includ you can include `<forward-request timeout="time in seconds" follow-requests`

`limit-concurrency` key and max count, then nested policy statement

`log to event hub` loggerId and partionID

`Mock-Response` status-code and content-type

`retry` actually has quite a few things:
- condition=MUST BE A BOOL
- count='retry attempts'
- interval='retry time in seconds'
- max-interval='max interval time'
- delta='interval dela in seconds'
- first-fast-retry='boolean expression'
- THEN ONE ORE MORE CHILD POLICIES

`return-response` response-variable-name='existing context var'
- `set-header`
- `set-body`
- `set-status`

## Finding Outbound ip addresses

```az webapp show \ --rgr --name --query --outputa```

## blob storage name

default endpoint for blob storage is: `http://storageaccount.blob.core.windows.net`

From there you can get to the container by appending `/container`

From there you can get to teh blob by appending `/blob`

Hence, all together it is:
`http://storageaccount.blob.core.windows.net/container/blob`

## Client Apps and Auth

You must provide the following:

- Client ID
- Tenant ID
- Instance URL / Identity provider
- Client credentials (clent secret or certificate)
- Redirect URL

From there you can call the builder, `IPublicClientApplication app = PublicClientApplicationBiulder.Create(clientId).Build.();`

You can also pass in `.WithClientSecret(secret).WithRedirect()` at this stage.

## SAS Token Composition

AS tokens havethe following:

`http://url.blob.core.windows.net/container/blob/sp=r&st=dateTime&se=DateTime&sv=ver&sr=b&sig=string`

Each part is important. URL is the blob identifier in this instance

sp=r is access rights (add create delete list read write)
st=dateTime is when access starts
se=dateTIme is when access ends
sv=ver is the storage API version number
sr=b is the storage being accessed (blob)
sig=string is the signature

## Graph Queries

```{http verb} https://graph.microsoft.com/version/resource?{query}```

HTTP Method can be basically any of the verbs. Post to create, Get to read, patch to update, put to replace and delete to delete.

version is generally 1.0 or beta.

resource is the identifier of the resource you're querying. this can be me/messages to return the messgaes you have sent etc.

Query params, which can be either REST method params or ODATA query options. This can be `filter=emailaddress eq riley@mercer.com` as an example

Graph Queries generally return, HTTP status code, response message and then the link to the next data.

# User and System managed Identities

if you want to set up managed identity and use the Azure CLI, then you can chuck in a `az app config identity assign` commadn and pass in some flags such as name of config and RGR

if you're using user managed identity, then it's much the smae, but you are creating that identity as opposed to assigning it. Hence the command is something like this: `az identity create --rgr rgr --name name`


## Queues and shit

If you're making a queue, make the queue client, then you can just quip one up using queueClient.Createifnotexists

Inserting messages onto the queue pretty simples. `queue client.sendMessage(message);`

Peeking a message: `if client.exists, peeked message = client.peek messages`

You can also update messages, but first you must dequeue them using client.ReceiveMessages()
