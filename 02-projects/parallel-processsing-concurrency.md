# Concurrency and Parallelism
## Definitions
Concurrency: When two or more tasks can start run adn complete in overlapping time periods. Does not require that they run at the same time. This is like multitasking on a single core. 

Parallelism: When two tasks literally run at the same time. Multicore processing.

Parallel Array: Also known as structure of an arraym parallel arrays are multiple arrays that are all the same size, in which each element of the array is closely related to the items at the corrasponding index in the other arrays.

### Parallel Arrays
They can be used in languages which support only arrays of primitive types and not of records (or perhaps don’t support records at all).
Parallel arrays are simple to understand and use, and are often used where declaring a record is more trouble than it’s worth.
They can save a substantial amount of space in some cases by avoiding alignment issues.
If the number of items is small, array indices can occupy significantly less space than full pointers, particularly on architectures with large words. 
Sequentially examining a single field of each record in the array is very fast on modern machines, since this amounts to a linear traversal of a single array, exhibiting ideal locality of reference and cache behavior.


