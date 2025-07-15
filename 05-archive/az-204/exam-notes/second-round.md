# Second Round of Practice

## One

If you are developing a containerised background application, that needs to keep costs low, traffic split, enable event driven app architecture and does not use K80s, then you want an Azure Container App.

If you are creating a containerised app taht wants to be highly available, always online, have fluctuating workloads and scale easily, then you want a Container App.

Fan in / Fan out pattern in function apps allows multiple functoins to be executed in parallel, whilst still waiting for all functions to finish. This often includes aggregations or similar work once everything is finished. 

DB Consistency levels, again. Eventual, because it doesn't care, bounded staleness, because it doesn't care except for when you tell it to, consistent prefix can only be bothered during the same batch, session is similar but batch based.

If you are updating meta data in a blob storage, then you use a PUT request not a post request.

blog CONTAINERS have the weird only takes two headers thing

if you need to document an APIM product / api then don't do so in the code?

When it comes to mixing resource types in containers then you need ARM templates to deploy everything at once. YAML only good for docker compose style thing.

If you are managing an Event Hub instance, then you want the event producer CLIENT in .NET 5+ and the HOST in versions lower.

System vs User assigned boils down to:

- Do you need deletion protection
- You can re-use user assigned permissions in different apps

EVENT GRID VS HUB
- hub is for high throughput processing
- grid is for routing and serverless apps
