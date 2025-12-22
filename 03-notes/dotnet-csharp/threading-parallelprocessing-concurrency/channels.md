# Channels

## Produce / Consumer Conceptual Model

Channels live in the producer / concumer conceptual programming model. That is, producers asynchronously 'produce' data and consumers asynchronously consume that data. Generally this is FIFO, but I don't think that's a required feature.

This is similar to other collection types such as `List<T>`s but `Channel<T>` manages synchrononisation and provide several consumption models.
