# Key Vault

KVS supports two types of containers, vaults and hardware security pools. 

They offer the following:

- Centralised secret storage
- Secure storage and retrieval
- Easier admin and monitoring

## Best Practices

To sue the key vault, you will first need to authenticate. You can use manged identity, service principal and certificate or secret.

KVS enforce TLS and provides storng authentication and privacy.

Perfect forward secrecy protects conections suing unique keys. These are RSA ased 248 bit encryption keys. 

You should use seperate vaults, control access, create bakcups, log and use recovery options.

# Managed Identities

You can have system assinged identities, which is enabled directly on the service and handled by MS (inclusive being tidied up if deleted) and user assigned (created as a standalone resource, new identity in the tenant, lifecycle manged seperately)

You want to use system assinged if you are contained to a single resource, need independant actions, for example if you run on a single vm

You can use user assigned if you want to share an identity, want to use more indepth auth flow, recycle resources but keep perms.

## Authentication flow

System assigned identity works like this:

1. ARM gets a request to make an identity, and makes it
2. It creates a service principal on the VM and updates the endpoint with the client info
3. Once the VM has an identity, the service princial grants that vm access to azure resources
4. You then authenticate against MS and use that token / go about your day

User Assigned identities work like this:

1. ARM gets the request and then creates it
2. it is then pushed to the resource, with permissions being granted based on role based access control configured in entra id and assigned to the service princiapl

## Configure Manged Identities

Generally it's just az {resource} identity assign flag name flag

If you are using system assinged identity, then you just need the level of permission required to access that specific resource.

If you are using user assigned, then yuo need the same but also to have the managed identity operator assignment.

## Getting a token

Default Azure Credentials let you get these things easily, they generally query different sources in order: Env, managed identity, vs, Azure, ps, browser

Service Principals are the 'basis for tokens'. I don't konw why but that does not make sense at all.

# App Config

Lets you manage settings and feature flags in a centralised cloud location. App Config lets you tag, retrieve, integrate, dynamically update things, encrpt and manage things in real time.

App Config is stored as key value pairs.

## Keys

They can be orgnised intto hierarchical pairs using a delimiter such as a / or a :

This is not parsed, it's just a formality, like a branch name

Names might be a bit different if you're using a framework though so be careful.

Keys are case sensitive unicode strings, but they cannot use the * , \ characters as they are reserved and must be escaped if you wnat to use them

Keys can be hierarchical or flat, with hierarchical being easierto read manage and use but flat being easy because flat

Keys can also have labels, which can distinguish two keys with the same key. This can be good for creating multiple versions of the same key in different environments but the same store?

Keys aren't versioned but you can use labels to get pretty much the same thing

You can also query keys as needed

## Values

Values are unicode strings, but generally you don't want to fuck around with storing secrets here

## App features

Feature management is a praactice to decouple releases from deployments and enables you to turn things around quickly.

In basic forms, a feature flag is a bool that turns code on and off. A feature manger is an app package that enables, caches and manages the feature. A filter sets the boundry of the flag, such as applying to different groups, browsers or locations.

Feature managment requires that your app uses feature flags and you have a repository that stores them.

Generally if you want to use the flag, you an just use an if statement that then checks the bool.

Generally when creating feature flags, any 'on' criteria should set the flag on and then skip the rest of the evaluations. 

You can use appsettings.json to turn flags on and off.

Generally, you should externalise the flags used in the app. This is where the app config comes in. Allowing you to use that as the platform by which to define and update flags.

## Securing app config

### Customer Managed Keys

COnfig is stored at rest using he classic AES-256. Accessing the config is then done through managed identities which access the KV, which can then decrupt the app config.

if you want to turn on customer managed keys, you will need standard tier of app config, soft delete and purge protection enabled and an RSA or RSA-HSM key to use. From there you can assign a managed identity and grant the get wrap and unwrap permissions to target the kv.

### Private Endpoints

You can also jsut use private endpoints in virtual networks to access data. This uses an IP in the virtual network to talk, which eliminates exposure to the internt. This lets you:

- Use firewalsto block all connections
- Increase security 
- Securely connect over either the same network or using virtual networking

### Managed Identieies

Azure to Azure is easy, just use a managed identity. System assinged is made using az appconfig identity assign command, user assinged requires you to create the identity, assign to the store and then use the CLI to configure that stuff. Generally use az identity create then identity assign.

Four more baby and only easy ones now.
