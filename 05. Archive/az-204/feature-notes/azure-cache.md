# Azure Cache

Is this always specifically for Redis? What on earth isa redis?

Azure cache for redis improves performance for apps that use Azure DBs by avoiding db calls for cached information.

## Redis

Redis is a widely used open source caching solution. It runs in memory and operates as a key value data store. 

Typically, this is implemented to complement db apps.

Caching aims to improve: 

- Performance, even under high loads it should increase throughput and reduce latency
- Scalability, should occur automatically and without downtime
- Availability, Must be highly available
- Distibution, must offer same performance and scalability in all regions

Redis is a product from Redis labs which can be implemented as OSS redis or the comercial product as a manged service, depending on what tier you choose.

## Architecture

Azure cache for Redis has the following pattern:

- Data cache, loads data into cache as needed
- Content cache, provides access to static content such as headers, footers and banners
- Session store, includes shopping cards or other browser based user data. Generally associated with cookies, which can be used to query back end dbs for user data
- Job and messaging queuing, Azure Cache for Redis offers a queue system to support long running jobs and queues?
- Distributed transactions, supports batched commands that run as a single transaction

## Tiers

Basic runs on a single vm and does not have an SLA, uses oss redis Standard runs on two replicated vms and uses oss redis. Both of these are single node caches and should not be used for critical workloads

Premium uses beefier vms and still usees OSS redis. Enterprise is higher availability and performance and uses enterprise redis. Flash tier is cost effective compared to enterprise and still uses enterprise redis. This uses nonvolatile flash memory which is cheaper per gig apparently.

All tiers use encrypted data in transport, network isolation and scaling.

Non, basic or standard tiers also provide: clustering, data persistence, zone redundancy, geo replication and import / export features.

Enterprise tiers give you the fancy redis enterprise tools such as RediSearch, RedisBloom, RedisTimeSeries and active geo-replication.

## How does it work?

### Distributed cache

Redis uses a distributed cache, which accelerates response times, reduces load on compute resources and data stores and integrates with dbs.

this can be useful to manage spikes, serve local content, and cache frequently accessed data.

### Session Store

This allows you to hold information which is user session specific. This can be a seemingly unlimited amount of users and also is low cost which is the most cost effective and scalable db storage option. Can be used for shopping carts, user cookies, sign in data and iot telemetry.

### Message broker

Redis lets microservices communicate async using a pub sub queue method. This provides a low cost temp data store, TLS encrypted network isolation communication method between services. 

This can be used for publishing news, financial data or app updates. Also works for chat messages or just misc communication between microservices.

### Cloud migration

Redis can help cloud migration. You can import and export relationa; db files, as well as patch, update, provision, scale and set up services. 

this lets you modernise on perm services and push them to the cloud. Also lets you use IAAS benefits.

To do this:

1. Import onprem redis cache to RDB file
2. Create an Azure Cache for Redis instance
3. Import the RDB file into Az Cache instance
4. Configure new app to point to cache instance

### When to use?

Use redit cache if you need simplicity, reliabiity or scalability

Other factors to consider are: Do you want a manged service? Comes with benefits such as automatic patching, updates, config, scaling and set up. Also monitor and allows he use of any redis client.

Is reliabliity critical? Redis offers high availability features including clustering, persistence , zone redundancy and geo-replication. This is enabled by redundant paris of vms, 99.999% availability, zone and geo redundant.

Do you anticipate sudden changes in load? Choose redis for thicc throughput capabilities.

### In Summary

Use basic tier for non-critical things, use standard for general purpose workloads, use premium for better performance, use enterprise for better performance again and enterprise tools, use flash tier when you want nonvolatile memory.
