# To Learn
what is the difference between multicasting to event hub and multiplexing??
- I actually worked this out pretty quickly, multicasting is a single stream through one queue
- Multiplexing is multiple streams through the same queue, request/reply enables it to reply multiple times
- Multicasting enables multiple consumers, multiplexing does now

Still not toally sure on the difference between the App Service Plan vs Environment.

Why is the 'ordered group of events' the partition. I thought the partition was just the processing capacity part. I suppose each partition has it's own order of operations and each set of operations can be passed to each partition. Never mind that does make sense.

Do staging slot settings stay with the slot of the app instance?
- When you stap the slots they inherit new settings

Azure Cache for Redis & Redis Modules
- Done, basically fancy db cache

What is a container group vs instance? 
- A container app is like the fun little version and I don't think insances are quite as scalable?
    - I actually nailed this
- Container groups let you group containers, container instances are a product on their own

I should really go over the DIY event feed thing:
- Monitored continer is the feed you're looking at
- Lease container is the state management container which other things are looking at
- Delegate does the work
- Compute instance is the vm that actually does the work, is not distinct from the above

When to use App Config vs Key vault

Creating Alerts in the Portal


Some of the connections and other kiiinda networky things from the App Service part.

what the different blob storage rules look like in json format.

Honestly jsut about all of the different code snippet parts I have skipped...
