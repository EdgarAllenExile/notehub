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

Bus -> Topic -> Subscription

Filters kinda jank but I think I am working it out. Actually no, Filters are still kinda jank. As an example, to test booleans, you use `user.property = TRUE` as opposed to = 1 or IS TRUE

## Function Apps

So from the SB, we then offload them with a function app, Then process them using a logic app?

Annoyingly, the version that is in production is in the wapf project for some reason

What the fuck is this configuration. Our Function app env settings are passed through to the function app in question either in the release config or the actual app service Function App page????

Oh we do that "%thing%" variable replacement thing!

## Logic Apps

Our logic apps are the ones that have the stupid GUI editor. Also they are actually in the app service plan thing. They are l2v2, single instance, not zone redundant and on a windows os/


