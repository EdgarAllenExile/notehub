# Messaging Queues

Azure service buses and queues are a connector for other Az integration systems. They integrate apps and components that span protocols contracts trust somains and network environments.

They actually live in the storage infrastructure and commonly used to create a backlog of work to process async. 

## Bus vs Queue

Use a bus when:

- Don't want to poll the queue
    - Can long poll recieve operation using TCP based protocol
- FIFO ordered delivery
- Duplicate detection
- Procss in parallel, each app consuming message streams as opposed to individual messages
- Transactional and atomacity when sending and receiving messages
- Messages under 256 or 1mb limit
- RBAC required

Use a queue when:

- Want to be able to store 80bg in a queue
- You want to be able to track process of a queue
- Server side logging

## Azure Service Bus

Az service bus is a fully managed enterprise broker with queues and pub sub topics used to decouple apps and services.

Data transfered using messages, which is a container decorated with meta data and holds data. This data can be of really any type, usually json, xml, avro or text.

Common use cases include:

- Messaging between business groups
- Decoupling Apps inmproving scalability
- Topics and subscriptions, enabling one publisher with many subscribers
- Messgae sessions, including message ordering and deferral

Wire protocol for service bus is the Advanced Messaging Queueing Protocol, which is an open standard and use with other on premises brokers such as ActiveMQ or RabbitMQ.

It is fully compliant with Java Message Serice 2.0

### Service Bus Tiers

Basic, standard and premium, with premium addressing customer concers about scale performance and availability for mission critical scenarios. Uses premium for production.

Standard has variablility, limited scalability and lower message size. It is PAYG though so that's good.

### Service Bus Queues

FIFO which enables async consumption even for different consumers.

Load leveling, which allows peak smoothing over the course of the app opperation.

Loose coupling.

### Service Bus Receivers

You can receive in 'receive and delete' mode, where the bus deletes the message from the queue when it is requested, however this is not upon completion so you must be okay with the potential for messgaes to be lost. This is the most basic set up.

You can also receive in 'peer lock' mode. Which is a two stage process for messages that cannot run the risk of not being processed. This locks messages from being processed until a callback is received. This allows for the service bus to unlock a messgae and make it consumable again. This also happens if the message isn't processed within a set timeframe.

### Topics & Subscribers

the producer consumer relationship is dictated by the pub sub model. Each published message is made available to each subscribed consumer. 

From there subscribers can filter message they don't need. This can be done by topic, which lets a subscriber consume from the subscription to that topic (but not the entire topic) and publishers can push to that topic. This actually just works like a queue.

You can apply filter actions at a subscription level, which creates a virtual queue. This modification can be done on just about anything such as built in properties or custom properties.

## Payload & Metadata

As with most things, we store meta data in key value pairs. 

Structurally, a service bus message consists of a binary payload, which is never touched by the service, and then broker / system properties and user properties set by the actual app itself.

### Routing

To move messages around you can use the broker properties To, ReplyTo, ReplyToSessionId, MessageId, CorrelationId and SessionId. 

If you are using a simple request and reply, you will use the ReplyTo property of an outbound message and the message/correlatoin id to confirm the reply.

If you're multicasting, then ou might send it to the topuc and multiple consumers will use the reply to property, however this time it will be pointed at the topic, rather than the queue itself. 

If you are Multiplexing, then several streams of related messages are routed through a single queue or subscription. You distinguish via using the SessionID property. This must be used with a peer lock. 

Furhter, if you are multiplexing and want many to many, then you reply to sesssionID property, which will ask the consumers to use that value in the sessionID property of their reply. After that, the publisher can wait for that sessionID to appear again back on the queue. 

### Serialisation

Payloads are always stored in binary. ContentType enables apps to describe the content and suggest a way to serialise them, according to MIME Type. 

There is also some fancy hidden serialisation that you can use in .NET Framework and with the SBMP protocol, that hopefully I neer have to deal with. This rquires use of AMQP messaging and HTTP clients don't like it.


## Queue Storage

Queue storage lets you hold a large number of messages. You can access them through http or https from anyehere.

Queued messages can be up to 64kb in size. Queues can hold as many messages as you  an fit in the storage account. Common use case would be to create a work queue to process async. 

Queues are generally componsed of four parts:

- URL to address the queue in the following format: `https://storageAccount.queue.core.windows.net/queueName`
- The Storage account that holds the queue
- The queue itself, name all lowercase
- The messages, which can be set to never expire

### Queues and .NET

Generally you can use .NET libs to manage these things:

- Az.Core for primitives, abstractions and helpers
- Az.Storage.Common, common lib
- Az.Storage.queues, Client lib
- SystemConfig.config manager, config files for clients

#### Dealing with queues

Generally you want to create a new Queue Service Client, then create a the queue if it doesn't exist.

Insert messages into the queue using SentMessage.

Peek messages using PeekMessages.

Update contents using UpdateMessage.

Dequeue using Receive Messages, then DeleteMessage to confirm that action post-processing.

Queue Length, using Getproperties then Approximate Messages Count property

You can delete and entire queue using delete on the queue object

Last one babyyyyy
