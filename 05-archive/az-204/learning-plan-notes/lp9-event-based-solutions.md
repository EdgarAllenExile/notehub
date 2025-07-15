# Event Based Solutions

Event grid lets you handle events efficiently and route them between az and non-az resources.

Event Grid is a pub sub message distribution service. You can use Hyper Text Transer Protocol (http) or Message Queuing Telemetry Transport (mqtt) protocols. 

Use Event Grid to build pipelines to integrate device and app data with serverless architecture. Also able to use mqtt for IoT things and HTTP things for classic pub sub situations. 

Event Grid supports CloudEvents 1.0 spec for interop, whatever that is. 

## Intro Concepts

### Publishers

Publishers send events to the grid. This can be the originator of the event or a proxy? The originator can be Azure services, self pushed, or non-az apps.

A partner is a publisher that sends events from its systems to make them available to Az. Configure these through the Partner Events feature. 

## Events and CloudEvents

An event is hte smallest unit of information that can fully explain something that has happened in a system.All events have some common information, such as source and time, as well as distinct infirmation such as specific to that type of event.

Event grid uses json mssages, the max size is 1mb and events are charged in 64kb increments.

An event source is where events hapen. Each source relates to one or more types. If your blob as an vent, then its source is Azure Storge. The Event source sends events to the grid.

Topics hold events published to the grid. Topics typically represent a collection of related events or specify how events should be handled. 

System tpoics are built in. Custom topics are third party and app topics and partner topics are published by a partner.

Subscriptions apply to topics, as in you create a subscription, note the endpoint to handle the event. 

Event handlers is where the event is set and then the handler takes further actoin to proces the event. Hanlders are usually either webhooks or a supported az service. 

Just use ENTRA and RBAC for security.

### Event Schema

There are two types of event schema, Event Grid Schema and Cloud event schema. Both have fourt sets of strings.

Data objects are specific to each publisher. 

Events sources send events to the grid in an array, which can have several event objects. 

In addition to the default schema, Event Grid ntively supports events in JSON implementation of CloudEvents v1.0 and http protocol. This is an open specification for describing event data. 

This open spec ensures interop by providing a schema for publishing and consuing cloud based events:

- Including uniform tooling
- Routing
- Event handling
- Deserialising event schema

This callows you to integrate across platforms which is nice. 

Event Grid and CloudEvent schema are broadly the same, but for content-type field. For CloudEvents, that's application/cloudevents+json and for EventGrids it is just application/json.

## Event Durability

Event Grid tries to deliver each event at least once for each matching subscription immediately. It will then retry based on policies.

By default it delivers one event at a time, with the payload being an array with a single event.

NB: it does not guarentee order for event delivery.

### Retries

if a delivery fails, Event Grid will:

- Retry, generally
- Dead letter, if config error
- drop, if dead letter not configured

the event, based on the type of error. Usually returns 400 or 413.

Retries are performed if not 400 or 413. Event Grid will wait 30s to retry, then after 30s it gets added back to the queue. After this the retry time grows exponentially.

If response is detected after 3m, then Event Grid will try and take it off of the queue. But this might not work. There are small randomisatoins to all retry steps and also might intelligently skip certain retries if it detects that the endpoint is unhealthy, down, or overwhelmed. 

Retry policy is configured on two groupnds, max number of attempts, with max being 30 and event time to live, with max number being 1440. Defaults to max for both. 

### Batching 

You can tell Event Grid to batch up events for delivery, which improves HTTP performance in high throughput scenarios. This is off by default and must be turned on per sub using portal.

You can set max events per batch, between 1 and 5000 as well as batch size pref in kbs. Generally both settings will be overridden if there is not suitable events to fill them.

## Delay, Delivery & Deadletter events

Event Grid will delay delivery if it detects that an endpoint is battling. If 10x deliveries fail then the endpoint is assumed to be experiencing issues and event grid will delay all subsequent deliveries and retries. This protets unhealthy endpoints and the event grid system. Event grid can overwhelm unprotected systems otherwise. 

When the Event Grid cannot deliver an event within a set period of time, or after it has failed a number of times, it flogs it off to a storage account. 

If either preconfigured retry or time to live limit is met, the event is dropped. 

Event subscriptoins allow you to set up http headers that are included in delivered events. You can set up to 10 headers when creating an event. only webhooks, service bus, event hubs and hybrid connections accept custom headers. 

## Access

RBAC, using Reader, contributor, subscriptoin reader and subscriptoin contributor.

This is not the actual permission ofc, which is Microsoft.EventGrid/EventSubscripions/{action}.

## Web Hooks

You can recieve events using web hooks.

When this happens, the grid will POST an HTTP request to the endpoint within the body. This requiresthat you prove ownership of the hook before it starts.

Logic apps, automations and functions do this automatically.

### Endpoint Validation

Grid endpoints can use synchronous or async handshakes to confirm. Sync handshakes require a validatoin code property, which is then confirmed and a validation code is returned in the response. Async is for tp solutions. You can also do manual handshakes but that sounds hard. 

First you need to validation URL, then to compolete the handshake, you must find the URL in the event data and GET it. The URL is valid for 5m and if it doesn't work, the provisioning is set to FAILED.

This authentication mechanism requires that the web hook send an HTTP status code of 200.

### Filtering

When creating an event sub you can filter by:n Event types, subject begins or ends with, or advance fields or operators.

By default, all event types for an event source are sent to an endpoint. 

# Event Hubs

This is a big Data streaming platform and ingestion service. It can receieve and process miiiiiillions of events and then provide those analystics to stuff.

Hubs are a native data streaming platform service in the cloud that can stream millions of events per second with low latency anywhere. 

## Key Capabilities & Concepts

Can use apache kafka and Advanced Messgae Queuing Protocol.

Schema Registry, lets you manage teh schema of event streaming applications. 

Real time processing for Stream Analytics.

Concepts:

- Producer applications that ingest data to a hub
- Namespace which is the management container for the hub, allocates capacity, security and geo redundncy
- Topics and Hubs
- Partitions, which maange capcity
- Consumer Applications, which combe through the event log and consume data
- Consumer Group, reads from the event hub and enables multiple consumers to read the same data independantly.

## Event Hubs Capture

Capture lets you process data on the same stream at variable rates. The Hubs Capture lets you specify your own receptical that stores data. it is written in Apache Avro. 

This lets you window to control capture, which sets a min size and time to capture. Each trigger causes a capture operation and each partition captures independantly.

Traffic to hubs is managed using throughput units. A single throughput unit allows approx 1mb per second or 1,000 events per second of ingress and double the amount of ingress. 

## Processing

Scaling your processing application requires you to run multiple versions of the app and have it balance the load amoungst itself. 

Generally use the EventProcessorClient (previously host) to do this. 

NB: Important to rememver partitioned consumers, this enables high scale by removing bottleknecks and facilitating end to end paralelism. What does this mean?

Event processers usually own and process for one or more partitions. This is distributed among instances. Each processer communicates its state to the store and communicate with other instances through it. This is how it load balances. 

When you create a processor you must note what function processeses events. You must handle it. Be as fast as possible. If you need to do two things (write and route) use two groups and two processors to split it up.

Checkpointing is a process that each processor marks the position of the last successfully processed event within a partition. Checkpointing is typically done within the function that processes the events and happens per partition. 

If a processor disconnects from a partition, another instance can resume processing at that checkpoint. If this happens, the processor will be told to skip to the checkpoint by the event hub. This allows multistage processes to mark certainstages as complete. 

Generally processing is done sequentially. Subsequent events run in the background for other threads. Different partitions run concurrently and each partition is synchronised.

## Access

Both SAS and Entra are used here. Generally uses the Owner, Sender and Receiver roles. 

Managed identities use RBAC settings to determine roles and access hubs using the right scope. 

To use a SAS, your client token must have manage rights and listen priverleges. This is defined at the entity not hte consumer level.

## Common Operations 

Inspect Event hubs using the client library.

Publish Events using the client library.

Read events using the client library.

Read events from a specific hubs partition using the client library.

Process events using the processor client library.

Two to go.
