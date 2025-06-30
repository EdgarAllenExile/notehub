# things to review on the morning of the exam

## Components of a .NET SDK Change Feed Processor

 The change feed processor in Azure Cosmos DB simplifies the process of reading the change feed and can be used to distribute the event processing across multiple consumers effectively. There are four main components in the change feed processor: the monitored container, the lease container, the compute instance, and the delegate. 

 The monitored container has the data from which the change feed is generated. The delegate component can be used to define custom logic to process the changes that the change feed reads. The compute instance hosts the change feed processor to listen for changes. It can be represented by a VM, a Kubernetes pod, an Azure App Service instance, or an actual physical machine. The lease container acts as a state storage and coordinates the processing of the change feed across multiple workers.

## Passing around client credentials through a request chain

OAuth 2.0 On-Behalf-Of flow (OBO) is used when an application invokes a service or web API, which in turn needs to call another service or web API. The idea is to propagate the delegated user identity and permissions through the request chain. The OAuth 2.0 authorization code grant can be used in apps that are installed on a device to gain access to protected resources, such as web APIs. The OAuth 2.0 client credentials grant flow permits a web service (confidential client) to use its own credentials, instead of impersonating a user, to authenticate when calling another web service. Implicit is a redirection-based flow. The client must be capable of interacting with the resource owner's user-agent (typically a web browser). Authorization code, On-Behalf-Of, and implicit cannot be used to delegate user permission and identity.
