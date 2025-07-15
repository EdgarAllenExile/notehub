# Functions vs Logic Apps

Both enable serverless workloads and both enable orchestrations.

Logic Apps use the GUI where as complex functions are probably going to want to use Durable functions extensions.

Key differences:
- Function apps are code first imperatives, where are logic apps are durable declarative
- Function apps have sozen of built in binding types and include custom binding code, where as logic apps have a variety of connectors and integration packs for b2b scenarios
- Each action in a function is an action, where as logic apps are ready made
- Both can use app insights, where as logic apps also use azure monitor
- You can manage functions using REST or VS, whilst logic apps also let you include Portal and powershell

Difference between Functions and web jobs is the scope and interaction with other systems. Function apps are serverless and auto scaling, they let you develop and test in the browser, you can pay per use and they also integrate with logic apps.

Functions, if they are hosted in a container can only be hosted on linux containers and only in premium plans and above.

Durable functions are like the orchestration backbone of a standard fucntion app and lets you manage state, checkpoints, restarts  and other things.
