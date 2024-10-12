# Web Services

Web services overview:

- A web service is a standard method for sending messages between clients and servers
- This is usually a software module that is intended to carry out a specific set of functions
- This is an open set of protocols and standards that allows data to be exchanged between systems
- Anything that conforms to the below requirements or common characteristics can be considered a web service

Web services requirements

- Web services use standard web protocols (http(s)), to connect
- They usually use XML (Extensible Markup Language) to communicate


### Functions of Web Services

* It is possible to access it via the internet or intranet networks
* XML messaging protocol that is standardized
* Operating system or programming language independent
* Using the XML standard, it is self-describing


### Components of Web Services

#### Simple Object Access Protocol

Simple object access protpcol (SOAP) is a transport independant messaging protocol. These are sent through HTTP.

Structure of the SOAP is a header contains all normal messaging info and the substance of the message is contained within the XML document body.


#### Universal Description, Discovery and Integration

Universal Description, Discovery and Integreation (UDDI) is the standard for specifying, publishing and discovering a service provider's online services. This is a repository of files that can be hosted so that a client application can discover WSDL file to learn about the various actions that a web service offers.

The UDDI registry holds the required info for the online service, similar to a phone directory.


#### Web Services Description Language

Web services description language (WSDL) has two purposes. It provides the location of the web service and how to invoke the correct service.

The WSDL is an XML file that explains what the web service does to accomplish these things. Using the WSDL, a client application should be able to understand where the web service is location and how to use it.


### How do Web Services Work?

The client sends a series of calls to the host server.

Remote procedure calls are calls specifically to the methods hosted by the web service. 

The data is exchanged using XML, which is a simple intermediate language that is understood by different programming languages. 


### Characteristics of Web Services

- XML Based
- Loosely coupled
- Can be either synchronous or asynchronous
- Coarse Grained
- Supports remote procedure calls
- Supports document exchange


### Advantages of Web Services

1. Business functions can be exposed over the internet
2. Interoperability
3. Communication with low cost
4. Standard protocol that everyone understands
5. Reusability
