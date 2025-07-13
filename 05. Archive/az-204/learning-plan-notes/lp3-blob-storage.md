# Blob Storage

## Introduction

Use blob storage for storing massive, unstructured data. This can include things like:

- Images and video
- Files for distributed access
- Streaming
- log files
- storing data for just about anything

### Types of storage accounts

#### Standard

Regular general purpose account used for anything

Can be locally redundant, geo redundant, read access geo redundant. Also zeon redundant, geo zone redundant and read only

Includes blob storage, queue storage, table storage and files

#### Premium

Offer higher performance using solid state drives, you can choose between three different types of storage acccounts depending on your needs

Can be Locally redundant or geo redundant

The other types of storage are called their own thing and seem to be mostly the same


### Access Tiers

Hot -> Highest storage cost, lowest access cost. Default tier.

Cool -> Stored for a min of 30 days. Lower storage, higher access costs.

Cold -> Stored for a min of 90 days. Lower storage, higher access cost.

Archive -> Stored for a min of 180 days. Has retrieval time delay. Storage cost effective, highest retrieval cost.

## Types of Resources

Blobs offer three types of resources. Storage Account -> Container -> Blob

Storage accounts are the name space in the storage hierarchy.

Containers organise blobs within accounts. You can have an unlimited amount of blobs within an unlimited amount of containers, within an account.

They must have a valid DNS name and URI to access. 

Blobs can be block blobs that store text and binary (up to 190.7tb), append blobs which are the same as block blobs and page blobs, which are random access files up to 8tb (virtual harddrives).

## Security

Service Side encryption as standard, client side available. 

Azure storage data is encrypted when it is stored in the cloud using 256 AES. Similar to BitLocker on Windows.

This happens for all accounts and cannot be turned off.

MS will even mange your keys for you, but you can ask them not to if you would prefer. This can be a customer managed key for storage and files (stored in KVS) or can be customer provided key for blob storage.

You can also hook this up to client side storage encryption, using regular AES libs and SDKs depending on your language of choice.

If you want to use client side encryption, you can choose either V1 (Cipher boock chaining with AES) or V2 (Galois/Counter Mode with AES).

## Blob Storage Lifecycle

You can implement rules based policies to manage blob storage. This can include moving things up and down tiers, archival, snapshots, file space management and naming rules.

This is dictated wihin a json file. This file contains a list of rules, filters and actoins that can be scoped within a container or object name.

Rules include filters and actions. The action then applies the tier change or deletion action within the object set. 

You can use policies with any of the following: Portal, Powershell, CLI and REST APIs.

In Portal, you go to the account, then click Data management -> Lifecycle Management -> Code View.

Azure CLI is just within the JSON file.

## Rehydrating from archive 

Whilst in archive, a blob is considered offline and cannot be read or modified. to do this, you must first rehydrate to either hot or cool. 

This can be done by either copying the existing blob to an online tier, or changing the existing blob to online. Usually, the best thing to do is copy it.

Rehydrating a blob can take hours. Best to do one big boy than smaller boys as concurrency is bad and slow.

You can set  this as high prio, which means you can get less than 10bg in about an hour. Stnadard prio can take up to 15 hours.

## Blob Storage Client Library

.NET client libs make calling azure storage pretty simple

They have things like Blob Client, Options, Container Client, Storage Client and URI Builder. 

### Create a client

Like with all Azure SDK things, first step is to create a client. This incoles passing a URI referencing the endpoint to that client. 

An authorized Blob Service Cient objet allows your app to callresources at the storage account level. This client lets you do the general Add Edit List Delete calls to conainers.

You can use a service client to create a container client, which then lets you call the container resources. 

From there you can create a standard spec blob client object to manage the blob resource. This can be done via either service or container client.

### Container Properties

Blob containers support both system and user properties. Generally, system properties are http headers and user metadata is name value pairs for a storage resource. These are also http headers and should be written as such.

You can get and set these by just claling the GetProperties methods.

You can also set and retrieve data. To set it you add the name value pairs to a new iDictionary object, then calling the set method. Get Properties does what yoyu think it should.
