# APIM

APIM is made up of a gateway, a management plane and a dev portal. 

The gateway is an endpoint that accepts and routes cals, verifies credentials, enforces rates, transforms requests and logs.

Mangement plane is where you provision and configure service, manage schema, package APIs, set quotas, get analytics and mange users.

Developer portal is automatically  generated documention, which you can use to read api, call api using console, get Api keys, access personal usage and get definitions.

APIM groups APIs into products. They have titles, descriptoins and terms. They can be both open or protected (subscribed to or not, pending admin approval).

Groups are how produts are controlled when being given to devs. These include admins, devs and guests. Admins can create groups to further refine this.

Devs get fun dev things.

Policies are used by APIM to perform tasks on the rquests or responses of an api. These can include rate limiting and converting from XML to JSON.

They can be scoped to basically anything.

## Gateways

Gateways are how clients konw what to call. It is a reverse proxy, routing from clients to services as well asthe authenication, ssl and rate limiting service. 

Not having a gateway means you're directly connecting client to service. Which can be problematic for the client code wise, might be messy if you're calling multiple services, can be less secure and might be an issue for publicly facing endpoints.

Gateways can be either manged and deployed in azure orself hosted using a containerised gateway. Good for hybrid or multicloud situations.

## Policies

Policies let you make changes and are basically the busines logic of an api.

You make them using xml starting with inbound and outbound statements. Plus backend and on error statements. 

Inbound statements apply to requests, backend statements apply before it's proxied to backend, outbound statements apply to the response and on error statements are just window dressing because I never make mistakes.

If you hit an error you skip everything else and just go to on error. you can review the on error staetments by using context.Last Error. 

Policies can used as attibutes or text within policies. This could be expressions such as c# @(expression) or multi statement c# such as @{expression} which returns a value. 

Each epression has an implicit context variable. 

These expressions let you use sophisticated means to control behaviour, without requiring you to write code or modify backend services.

You can also filter data elements, using the policies.

## Advaned Policies

There are a variety of advanced policies you can use with APIM:

- Control flow, which conditionally applies policies based on a bool
- Forward request, forwards the request to the backend
- Limit Concurrency, which prevents enclosed policies from executing more than a specified number of times
- Log to event hub, send messagesto the event hub
- Mock response, aborts pipelines and mocks responses
- Retry, sets retry limits

### Control Flow

Choose policies and key words let you evaluate bools adn then funnel the requests through those policies. 

Kinda like a switch statement, but only for bools, uses choose and when as opposed to switch and case.

### Forward Request

Kinda self explanatory

### Limit Concurrency

Prevents policies executing more than the specified number of times, once met, returns 429 Too Many Requests status code

### Log to Event Hub

Policy that sends messages in the specified format to an event hub defined by the logger entity. Used for saving requests or response contexts for analysis.

### Mock Response

Used to mock APIs and operations. Aborts normal execution and returns a mocked resonse. 

The policy always tries to return responses of high fidelity and prefers examples if available. Can include schema if possible.

### Retry

Executes once and then a number of times, unless the provided condition becomes false or the count is exhausted.

### Return resonse

aborts the execution and returns either a default or custom response. Default is 200 with no body. Custom responses can be passed.

## Subscriptions

It is easy and common to access APIM through subscription keys. 

You need to include a sub key in your request when calling these APIS. The gateway will reject calls without keys and not process them.

A subscription is somehow a container for keys, devs can get these keys and publishers can create subs for consumrs.

Subscriptions can be for all apis, single apis or products.

this is default called ocp-apim-subscription-key and subscription-key

## Certificates

You can also secure APIs using TLS certs. You can then restrict them by a variety of things, including CA, thumbprint, subject or expiry date.

Usualy you will also then inspect the cert and confirm it's not been tampered with. You should generally check who issued the cert and that you trust that person. Especialy if it's self signed.

You can accept certs in the consumption tier, which is a good choice if you are using serverless technologies (functions).

To do this, you must enable cert usage in the custom domains page. 

Auth policies are set within the inbound rules in the gateway.

### Hash

Every cllient supplies a thumbprint, which is a hash creating using the cert properties. This ensures that the cert has not been modified or altered since creation. This print can be checked using your cert policy.

You do this by negativey checking that it is not what you think it should be and then denying the request.

Three left!
