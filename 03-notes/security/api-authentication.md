# API Authentication
Authentication to an API is usually done through an authentication token. These authentication tokens will contain the various scopes that the sender is able to use when accessing the API.

## Scopes
API scopes allow for you to restrict access to certain parts of the API. You may want some users to only be able to access read calls, so you grant those users the read scope and require write authorisations to access the write endpoints in your controller.

## Azure App Service Specifics
### Authentication on Behalf of a User - Managed Identity
Managed identity allows for an app to authenticate to Azure, using a user's credentials and then access the API as if it was that user.

It is possible to do this using Azure Managed Identities. There are two different types of managed identities. System assigned and User assigned. I have not used user assigned as yet, so we shall keep that seperate.

#### System Managed Identity
System managed identities work by certain Azure resources automatically creating service principals in Entra ID for the resouce's identity. Only this resource can use this identity and request tokens from MS. The name of this 'user' is always the same as the resource. 

This allows the resource to access other resources on its own merits. For example, it allows an API to query an SQL db within the same resource group. This requires that you add a contained database user to the relevant DB, the name of which must be "resourcename".
