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


