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
