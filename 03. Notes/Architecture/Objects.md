# Architecture Objects

## Models

- Models belong in the Client Layer
- They should do no processing of information, only take that which comes from a form
- They should be converted to a DTO by the Client Layer and sent to the API Layer


## DTOs

- Data Transfer Objects, live in a shared layer
- Should be sent and recieved by both layers, the T in transfer is because they are TRANSFERED across the internet


## Entities 

- Also known as Data Access Objects, Entities live in the API layer
- Should be mapped from a DTO before being communicated to the data source
