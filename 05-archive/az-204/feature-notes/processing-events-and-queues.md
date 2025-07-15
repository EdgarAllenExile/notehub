# Incude Stuff here

## Service Bus

There are a variety of things to keep in mind when service bussing, such as what sort of a pattern you are using for your communications. These are generally for situations in which the publisher sends a message andthe subscriber is expected to advise they have received and or processed it.

- Simple request and reply, 1:1 inclues a Reply To field which the responder can use the MessageID of the handled essage and the correlatoinID of the reply message.
- Multicast request / reply, in which the publisher sends a message into a topic and expects a response, however each of the subscribers can reply. In this scenario a REPLYTO will point to the topic.
- Multi plexing, which is 1:many, but all processedthrough a single queue, usually keep things together and organised using sessionID to lock out unintened processing etc
- Multiplexing request / reply. Doesn't need to be session aware, but you need many : many

## Storage queue

Your storage queue URL is storageAccount.queue.core.windows.net/queueName then the message is in the request body.

## Change Feed Processing

If you are so inclined, you can read the cosmos db change feed, either pulling htem off or gettin them pushed to you.

Usually a push model is used. Geerally this is done using an Azure Function, using the trigger for cosmos db
