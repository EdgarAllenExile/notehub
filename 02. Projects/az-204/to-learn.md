# To Learn
what is the difference between multicasting to event hub and multiplexing??
- I actually worked this out pretty quickly, multicasting is a single stream through one queue
- Multiplexing is multiple streams through the same queue, request/reply enables it to reply multiple times
- Multicasting enables multiple consumers, multiplexing does now

Still not toally sure on the difference between the App Service Plan vs Environment.

Why is the 'ordered group of events' the partition. I thought the partition was just the processing capacity part. I suppose each partition has it's own order of operations and each set of operations can be passed to each partition. Never mind that does make sense.
