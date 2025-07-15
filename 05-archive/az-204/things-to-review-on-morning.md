# things to review on the morning of the exam

## Components of a .NET SDK Change Feed Processor

 The change feed processor in Azure Cosmos DB simplifies the process of reading the change feed and can be used to distribute the event processing across multiple consumers effectively. There are four main components in the change feed processor: the monitored container, the lease container, the compute instance, and the delegate. 

 The monitored container has the data from which the change feed is generated. The delegate component can be used to define custom logic to process the changes that the change feed reads. The compute instance hosts the change feed processor to listen for changes. It can be represented by a VM, a Kubernetes pod, an Azure App Service instance, or an actual physical machine. The lease container acts as a state storage and coordinates the processing of the change feed across multiple workers.

## Passing around client credentials through a request chain

OAuth 2.0 On-Behalf-Of flow (OBO) is used when an application invokes a service or web API, which in turn needs to call another service or web API. The idea is to propagate the delegated user identity and permissions through the request chain. The OAuth 2.0 authorization code grant can be used in apps that are installed on a device to gain access to protected resources, such as web APIs. The OAuth 2.0 client credentials grant flow permits a web service (confidential client) to use its own credentials, instead of impersonating a user, to authenticate when calling another web service. Implicit is a redirection-based flow. The client must be capable of interacting with the resource owner's user-agent (typically a web browser). Authorization code, On-Behalf-Of, and implicit cannot be used to delegate user permission and identity.

## Cosmos DB consistency levels

Session consistency offers all the guarantees listed. It provides write latencies, availability, and read throughput comparable to that of eventual consistency. It also provides the consistency guarantees that suit the needs of applications written to operate in the context of a user. Strong consistency has reads guaranteed to return the most recent committed version of an item. A client never sees an uncommitted or partial write. Users are guaranteed to read the latest committed write. It has the highest write latency and lowest read throughput of all consistency levels. In bounded staleness consistency, the reads are guaranteed to honor the consistent-prefix guarantee. It should be used when there is a need for low write latencies but require a total global order guarantee. In eventual consistency, there is no ordering guarantee for reads. In the absence of any further writes, the replicas eventually converge. It is the weakest form of consistency because a client may read values that are older than the ones it had read before. Eventual consistency is ideal when the application does not require any ordering guarantees.

Reading from CosmosDB
- Eventual consistency has the highest availability but no ordering
- Strong is orderd, boundless is lower availability
- Session is monotonic reads, but no guarentee if value read is last value written

Predictability is inversely proportionate to throughput

WHY IS EVENTUAL THE MAX THROUGHPUT. It is because you forgot how to think about it. FIFO on one end, throughput on the other. Strong is FIFO, Eventual is throughput.
- Eventual because it doesn't care, then bounded because it mostly doesn't care, then session because it only cares about the batch, then bounded but that probably depends on what you send and then Strong, because it does care.
    - I accidently really like the caring thing. Bounded staleness cares about it, session kinda does, strong really does etc.
    - Still not 100% on session vs prefix.
    - Session is monotonic
    - Bounded staleness is additional to consistent prefix because bounded stalenes is also bound by the staleness requirements.

