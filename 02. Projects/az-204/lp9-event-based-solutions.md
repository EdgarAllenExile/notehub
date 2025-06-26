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


