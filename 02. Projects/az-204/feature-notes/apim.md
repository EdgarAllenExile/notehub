# APIM

APIM is made up of three parts, the API gateway which general users will interact with, the developer portal, which only developers use and then the management plane which configures how and who can use the other two.

## Components

API Gateway, for sending and recieving calls, authenticating, enforcing quotas and rates, transforming requests, caching response and doing logs / monitoring.

Management Plane, for configuing settings, defining and important scheme, packaging APIs into products, setting policies, getting insights and managing users. 

Developer portal, for documenting the API, calling it using the console, creating an account, accessing dev analytics and getting / managing API keys.

## Types of Gateway

Apparently you can self host the gateway which is when you containerise it and deploy it yourself. Generally something you might want to do if you have a hybrid set up or you need to host the gateway in the same spot as the backend services.

## Policies

Policies are ways to route and manipulate your APIM handled requests. They are written in xml and generally have four parts, inbound, backend outbound and on error. 

They look something like this:

```
<policies>
    <inbound>
        statements applied to the request
    </inbound>
    <backend>
        statements applied BEFORE request is passed to backend services
    </backend>
    <outbound>
        statements applied to the response from the backend
    </outbound>
    <on-error>
        statements that handle errors
    </on-error>
<policies>
```

Interpolating and or using expressions can be used within policies by using an ASPX style approach, such as @(expression) or @{expression} for code blocks

Generally if you need to get at the error or look at other things, you cango through the context. Context. data will get the request. Context.lastError will get details of the last error.

### Parts of the Policy

Once you are within the statements to actually with within, you can then do things like: 

```
<base />
<set-header name="x-request-context-data" exists-action="override">
    <value>@(context.User.Id)</value>
    <value>@(context.Deployment.Region)</value
</set-header>
```

Referencing the above, you would have policies inbound before the base and then inbound / backend / outbound / error afterwards.

### Conditional Policies

You can also use `<cross-domain />` at the start to execute before anything else and call arbitrary things such as `<find-and-replace>` or similar.

### Logic Flows within policies

if you want to do some real nerd shit, you can include conditional logic such as `<when condition="@(1=1)`

from there you can manipulate the request by using something like `set-body`.

General logic flow is 
```
<choose>
    <when condition=...>
    </when>
    <when condition=...>
    </when>
    <otherwise>
    </otherwise>
<choose>
```

You can also forward requests using `<forward-request timeout="time in seconds" follow-redirects=bool/>`

If you are feeling zesty you can also select somestatements to only be run a few times, with a `limit-concurrency` statement and then nesting the logic afterwards.

Logging to event hubs is also an option, if you use `log-to-eventhub logger-id=123 partition-id=23` then specifying where to be written to

You can also set mock resonses or the retry policy.

Finally if you just want to quick everything and return you can stick in a `return-response`

### API Subscriptions

Clients must pass their subscription key in the `ocp-apim-subscription-key` header to veryify that everything is kosher before proceeding.

### APIM Certs

You can also use certs to do much the same thing, the only differnce is that you need to verify the thumbprint within the conditional logic of your API [policy] generally this is done on the inbound and is checked against what the APIM has stored on its end for that particular client.
