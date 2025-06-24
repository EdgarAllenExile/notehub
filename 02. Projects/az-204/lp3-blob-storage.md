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


