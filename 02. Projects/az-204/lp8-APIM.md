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


