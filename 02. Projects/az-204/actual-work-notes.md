# Things that I am learning from work

Our storage account actually holds event hub topic as well as several blob containers

The headers on the requrest to the storage account are:
`Server: Windows-Azure-Blob/1.0 Microsoft-httpapi/2.0`
`x-ms-request-id: string`
`x-ms-client-request-id: string`
`x-ms-version: dateTime`
`x-ms-error-code: string`
`Date: dateTime`
`Content-Length: int?`
`Content Type: mime-type`

So, how do we go from the request id or the client request id for that matter, to the content or at least useful info about the request?

omg we use SAS keys for something

So INT-OME-01 is a container instance, I assume that just means it's the instance of the container. Then we have the respository.

## Service Bus

So the API drops things in to the service bus, it has a variety of queues, but we are interested in the topic. From the topic, we have two subscriptions. Somehow there is a transformation going from the subscription to the logic app that I cannot see.
