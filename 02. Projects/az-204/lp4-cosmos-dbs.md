# CosmosDBs

## Key Benefits

Low latency, eslastic scalability of throughput, well defined semantics and high availability.

You can configure dbs to be globally distibuted and available in any Azure region. You can add or remove regions at any time, independant of your app deployment.

CosmosDB uses multi-master replication, which supports both writes and reads. This enables elastic write and read scalablility, ultra high scalability and super high performance. 

## Db Containers

Cosmos Db containers scale out. Data is storedi n partitions, you increase partitions as throughput or need increases. This means that you can infinitely scale out.

Containers require partiion keys to efficiently move data across partitions. This allows Azure to move data to the correct partition for the action to be taken. These can also be stuck in a WHERE clasue.

Physically, Partitions are used as storage mechanisms. Physical partitions can handle 10k request units per second and store about 50gb of data. This is abstracted by Az which use logical partitions of about 20gb.

When you create a container you can give it either shared or dedicated throughput. Dedicated can be set to autoscale, where as shared is defined per db and then shard between the containers within that db.

## Consistency Levels

Data consistency is managed along a spectrum of two extremes, strong and eventual. 

These levels are region agnostic.

Default consistency is configured and applies to all dbs and containers under the account. The consistency chosen is 100% guarenteed by MS, which is fun.

### Strong Consistency

Offers fully linear request serving. Read actions are guarentees to return the most recently committed version of an item. A client will never see an uncommitted or partial wite. Users will only ever see latest commit.

### Bounded Staleness Consistency

Bounded staleness consistency lets you set a specified about that a client can be served. That is, you can either set 'versions' or 'time' and either isthe floor for the level of staleness that you will accept. This can allow you to throttle writes if there is a lag which will allow you to write across region. 

if you are only using the single region, then this is pretty much teh same as session and eventual consistency

### Session Consistency

Within a single client session, the reads are guarnteed to honour the read your writes and the writes follow reads. This only really works if you have a sinlge writer or token shared across multiple writers.

Like all non-strong consistencies, writes are replicated to a min of three replicas (of four total) then applies asynchonously to other regions.

### Consistent Prefix Consistency

Updates are made as a single document writes and see eventual consistency. This means that updates are made as a batch within a transaction adn are returned consistent within that transactions. Multiple write operations within a transaction are always visible together. 

That means that if you update two docs in a transaction, the reader may see either v1 or v2 but never different versions of the same document.

### Eventual Consistency

No guarentee for reads, if no other writes the replicas will eventually converge. This could be used in simple increment counts, such as likes or retweets.

## APIs

You can use whichever API you would like, such as NOSQL, Monogo, Postgres or the other ones.

Natively, we use NoSQL. If you can choose based on anything, just use NoSQL.

Apache Cassandra uses column schema, which is cool. 

Gremlin lets you use graph queries and store data as edges adn verticies. Use this if you want to use dynamic data, complex relational data or if you use the Gremlin ecosystem already.

Table should be used if you're already using table and can't be bothered to migrate just yet.

## Request Units

Charges are paid hourly, and throughput is provisioned to ensure sufficient resources. This is noralised in terms of Request Units, which is an abstraction of the resources used to perform db operations.

Reading a 1kb item using id and key value is about 1RU. 

RUs are consumed at a variable rate depending on how your account is set:

- Provisioned throughput assigns a number of RUs to use per second
- Serverless mode is basically on consumption
- Autoscale lets you monitor usage and adjust accordingly, should be used for mission critical tasks with unpredicatable useage

# Working with CosmosDB

The .NET SDK uses boring generic names for things, being container (collection, graph or table) and item (documnt, row, edge). 

## Cosmos Client

Creating a client is threadsafe  and you should use a single CosmosClient uring the life time of the application. Singleton?

## Stored Procs

You can write stored procs for Cosmos db to write stored procs, triggers and user defined functions.

Stored Procs are registerd per collection and can operate on anything within that collection. 

Context is important within these operations as they determine which actions can be taken by that thing. 

All operations must execute within a limited lifetime. All functions will return a bool that represents if they do not complete.

### Insert

When you create an item in a container, the id is returned. Creating is async and depends ont he callback function. This is a JS function whch has two params, one error object and a return value. You can either handle the exception or the runtime will do so. 

You can also pass a bool somewhere which will require a description be set. 

params are always passed as a string to a stored proc. Even if you pass an array, this will be converted to a string and passed. To get around this, you should build a little functoin within the proc to parse the string and return an array.

### Transactions

you can use transactions on items within a container using procs. This obvs uses JS and can batch or resume execution depending on what happens. The Continuation value can be of any value and the app will then use this value to resume the transaction. 

An example of this, would be to send a batch of docs to the db, it can try to create them and then observe the return value. If the value is not equal to docs sent or if it did not create any docs then you can return.

### Triggers and UDFs

Pretriggers execute before events and post triggers after them...

Triggers are not automatically executed, they must be specified for each operation that you want them to execute.

Pretriggers do not accept parameters, but they can be used to validate or manipulate the requests. This could include inserting a timestamp if there is one missing. 

Post Triggers execute in the same transaction as the actual transactoin and can include things like updating meta data etc. If the post trigger fails though, this will throw an exception and the whole transaction is rolled back.

UDFs or User Defined Functions can execute within a query and provide increased functionality. This might include categorising data depending on its value (tax brackets for income).

## Change Feed

cosmosDB instances have a persistant change feed that records changes as they happen. This uses a db litener which outputs a sorted list of documents that were changed in the orderthat they were modified.

these can be processed async and incrementally and can be parallel proccessed across multiple consumers.

Change feeds cannot be updated and doesn't log delete actions. To get around this you can add a 'deleted' field to an item then set a time to live to delete it later.

### Working with the Change Feed

Can use as either a push or pull feed. If you are pushing, then there needs to be some sort of change feed processor. The complexity of such actions are required to be managed by the processing resource. 

Within a pull model, the client must do this work. The client has the logic for processing and must store the state for the processing work. 

Generally you wnat to use the push model so as to not need to worry about polling the chagne feed. Pull model is good because its extra low cost though. This can include, reading a partitions chnges, throttling changes for processing and doing a one time read of the chagne feed. 

### Push Model

Generally, Function triggers and change feed processor lib are how you use push model. Functions just use the processing lib behind the scenes though, so its less fun.

You can trigger functions based on events in the CDB.

Change Feed Processor lib comes as the azure cosmos .net and java sdks. There are four main components, monitored contianer(what you are watching), lease container(stage storage across multiple workers), compute instance (hosts the processor, can bea vm, app service or hardmetal) and delegate(code that acts on each change read). 

When implementing, the entry point is always the monitored container. From there you call the builder and then implement it. First param passed is name, then you identify the delegate. After that you can define the computer instance and lease container. 

You canthen build and start it.

### Lifecycle

1. Read change feed
2. if no changes, sleep then go 1.
3. If there are changes send to delegate
4. Once complete, then update the lease store with the processed data and go 1.
