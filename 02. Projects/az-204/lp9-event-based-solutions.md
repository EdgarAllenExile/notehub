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

Event Grid will delay delivery if it detects that an endpoint is battling. If 10x deliveries fail then the endpoint is assumed to be experiencing issues and event grid will delay all subsequent deliveries and retries. This protets unhealthy endpoints and the event grid system. Event grid can overwhelm unprotected systems otherwise. 

