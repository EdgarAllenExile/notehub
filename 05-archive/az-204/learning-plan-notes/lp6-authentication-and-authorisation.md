# Identity

## Service Principals

When you register an app, you create an an entity that lets you integrate with Entra. 

An app object is the global represnetation of an application across all tenatns. The service principal isthe local representative within that tenant. Service principals are effectively derrived from app objects.

### APplication Objects

An Entra app is an app object, this object creates service principals. These service principals are generated in each tenant that the application is used.

The application object describes three aspects of an app:

- How it issues tokens
- Resources that it can access
- Actions it can take

### Security

When an entity is requesting access, it must be represented by a security principal. This is true for users (user principal) and applications (service principal). 

These principals define the access policy and permissions for the user / application in the tenant. 

This enables features such as authentication and authorisation.

There are three types of service principal:

- Application, managed identity and legacy. 

Service principal is the most rudimentry.

Managed identity provides an identity for apps that connect to Entra auth. Managed identities can be granted access and perms, but cannot be updated directly.

Legacy apps which are pre-app regs and are basically just stand ins.

## Permissions and Consent

Identity implements oATH2.0

All resources that integrate with the MS identity platform has an App ID URI and complies with the oAUTH 2 rules. 

In oAuth these permissions are called scope; This is a string value and you know all about them. 

## Types

You can have delegated access for when you have users and app access for when you do not.

There are also types of consent. User consent, in which the user must consent to that app behalf of users. This is tricky though as an app can only do things at the first instance, which users don't like and does not allow the app to develop.

There is also incremental consent, which requires the user to add on consent each time it is needed.

And also Admin consent. Which requires an admin to consent to and is only for the highest level priverlage. 

## Conditional Access

This allows you to restrict use unless users meet criteria, such as location, MFA and intune.

This is usually done silently to handle the conditional access challenge. This can be like an interactive signin request. 

However you do sometimes need to code it in. Such as SPA, on behalf of flows, when web apps call resources. 

Conditional access policies can be applied tot he app and also a web api the app accesses.

# Microsoft Authentication Library

MSAL offers a variety of authentication flows to ensure that you can make it work in any scenario. These include:

- Authorisatoin code, for accessing apis on behalf of a user
- client credentials, for app accessing apis on its own
- Device code, for smart and iot things
- Implicit grant, don't use this, but is for auth code situations
- ON behalf of, Upstream apis to downstream apis on behalf of a user. is passed through one API to the next
- Username/password
- Integrated Windows Auth, for apps that are on the domain to get tokens silently

## Clients

MSAL has two types of client, public and confidential. These differe based on their ability to authenticate to the server. Public clients run on desktop, mobile or client side browser apps. They are not safe and can only access APIs on behalf of the user. Cannot use secrets.

Confidential client apps run on servers, web apis and other things. They can assert their identity and hold secrets.

Generally you init a client using the client app builder. We have actually done this, thankfully.

MSAL.JS is how you do SPAs.

# Shared Access Signatures

a SAS is a signed URI that points to a storage resource and a token that enables access. This token includes how the resource can be accessed by the client. the SAS is how azure storage authorises access it the storage resources.

## Types

There are three types of SAS. Generally MS recommends using Entra authentication where ever possible.

User delegation, secured by entra credentials and by the permissions specified to the SAS. ONLY APPLIES TO THE BLOB STORAGE.

Service, secured by storage key, can allow access to blob, queue, table and files.

Acount, delegates access to a resource, all operations available using the initial SAS are available. This SAS uses the above types. 

## How do they work?

SAS have two components, the URI and teh actual SAS. 

The actual SAS token conains the following parts:

- First part is the access rights, SP=a(dd)/c(reate)/d(elete)/l(ist)/r(ead)/w(rite)
- Then comes the date time when access starts
- Then comes the date time that access ends
- The versoin of the API to use
- then the type of storage to use (sr=b(blob))
- Then a signature, sig={string}

## Best Practices

- Always use HTTPS to prevent man in the middle attacks
- Use User delegation SAS whereever you can.
- Use as small as possible expiration times
- minimum required solutions
- if SAS are too risky, create a middletier service to go between.

## When to use a SAS.

Generally use a sas to provide storage account to a client that would not otherwise be able to access those resources.

This might include if a user can read and write data to a storage account. Such as if the client can up or download the data through a frontend uding authentication. Then the client can use the storage account for as long as they need, until they don't, 

There are also, more technical uses:

- When you want to copy a blob, file or blob to file / file to blob between storage accounts, or anywhere if converting.

## Stored Access Policies

These policies provide an extra level of control over service level SAS on the server. This allows you to further restrict usage and can be used with just about anything in a storage account. 

To use a stored access policy, call SET ACL, then you can create a unique identifyer and the params of the policy.

To revoke the policy once it is set, you can actually delte it or change just avout anything else about it. This will break the asociation between that policy/token and any associated signatures to expire. 

otherwise you can jsut call set ACL again and pass an empty body.

The access policy is the most secure and flexible way to implement SAS.

# Graph

Graph is the gateway to data in MS365. It provides programmability to use the data in MS products.

The Grapg API allows you to do REST API things, including managing users, devices, compliance and security.

Graph Connectors ingest data external to MS into graph services. 

Graph Data Connect is the output mechanism that enables delivery of graph data to azure data stores.

## Rest 

Graph API lets you make requests from your app once you are authenticated. 

Graph API uses the ODATA namespace ms.graph and basiclaly everything lives there.

Graph queries look like normal api queries. HTTP ethod URL / version / resource / query

you get back a status code, a response message and a next link

### HTTP Methods

GET -> Read from a resource
POST -> Create a resource or perform an action
PATCH -> Update a resource
PUT -> Replace a resource
DELETE -> Remove a resource

Not really very CRUD. The request body for post / patch / put must follow JSON standard format.

### Version

Can be 1.0 or beta

### Resource

Can be an entity, complex type or basically whatever. This can include the resource you're interacting with, or the relationship, such as me/messages etc.

### Query Params

Generally using OData system query optoins or strings, params let you filer the graph query, such as filter=email eq 'riley@computer.com'.

This does use spaces which is honestly terrible to look at and I do not like it.

### best Practices

You need an OAuth 2.0 token adn pass with the header or the client constuctor. Generally just use MSAL to do this.

Other things that are good are:

- Least priverlage
- User the best permission type, such as signed in users using delegated perms
- Think about who is consenting and when 
    - if admin, do they need to? If user, do they need to do everything ll at once?
- Consider multi-tenant apps
    - Consent might be disabled or access might be configured by that admin
- Be mindful about hanlding responses, such as using pagination and using the @odata.nextlink property
- Then also whatever evolving enums are
- Try not to store data locally.

Five more baby
