# Onion Architecture

Onion architecture generally involves placing the traditonal layers of an application around the domain layer.


## The Layers

There are four main layers to an onion architecture application:

1. The Domain Layer
2. The Repository Layer
3. The Service Layer
4. The UI Layer

### Domain Entities Layer

The centre of the application, this is where the domain entities live.


### Repository layer

This is effectively an abstraction layer between the domain layer and the business logic layer. 

Aims to promote loose couplings for data access. A generic repository is created which queries the data source for the data, maps it to a business entity and persists changes in the business entity to the data source.


### Service layer

This layer holds the interfaces that are used to communicate between the UI layer and the Repository layer


### The UI Layer

This is the most external layer. It could take any form. 

The UI layer communicates with the application through the interfaces.
