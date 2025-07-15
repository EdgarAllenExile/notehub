# Blobs, again!

There are several parts of the blob sdk:

`blob client` which lets you manipulate blobs
`blob client options` which sets config options for blobs
`blob container client` which lets you manipulate the storage container around a blob
`blob service client` which lets you manip at a top level
`blob uri builder` which is a nice easy way of modifying contents of a URI instance

Generally if you want to deal with blobs, you should do it something like this:

1. Create a BlobService Client, which lets you interact with things at a storage account level
2. Create a BlobContainerClient, from the service client. This then lets you manipulate services
    2.1 This is not strictly required and you can just create a container scoped client if you only need to do one or two things
3. Finally you can create a blob client, this can be from the blob container client

Generally, when you are doing this, you can either pass in the URI directly or you can use the container level above and use 'getTYPEClient(name)'

## Meta Data

Generally, the meta data for a resource is in key value pairs. Our example is seneitive and bool

When you are actually getting the meta data header they look like: 

```z-ms-meta-name:string```

### System properties

Generic properties that ALL things have

Includes things like:

- URI
- Access level
- Last modified date
- Status
- Error code

### User meda data

You can actually create whatever sort of meta data you want or need. 

This is done in key value pairs.
