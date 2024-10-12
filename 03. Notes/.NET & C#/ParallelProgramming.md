# Tasks

Tasks live in system.threading.tasks

Tasks own actions

Tasks are naturally multithreaded

When using slanty braces to indicate a type, you are declaring a generic type. Generic types appear everywhere.

Getting the result of a task is a blocking operation

## Task Cancellation

Cancellation tokens are things that exist. Not massively sure what the impact of this is. Maybe if you have a constantly executing tasks?

Throw New operationcanceledexception will exit task and not report all of the way up to the user

You can also link cancellation tokens together and handle them together with CreateLinkedTokenSource

## Exceptions

You can actually aggregate all of the exceptions and then report them all at once which is kinda sick

Exceptions in multithreaded operations are only breaking if you are observing them

## Locks

Used to ensure threadsafe things are threadsafe. Actually not sure if I need to reeeaaaaallly worry about this just yet.

Spin locks

Mutex; lets you try and get a lock but will wait for the ability to do so?

Reader writer locks let you READ from multiple locks at once, but only WRITE on the single thread

- ReaderWriterLockSlim is class

# Threadsafe Lists

## Concurrent Collections

### Concurrent Dictionary

Similar to other types of collection, but is a liiiiitle different.

- Exceptions normally triggered by .add, but exceptions are only effective in mutlithreaded situations if they are observed

### Concurrent Bag

What on earth is a bag.

Bags of elements are fast, provided that you do not care about their ordering??


# Parallel LINQ

Default LINQ queries are sequential; but there are parallel options, namely PLINQ.

You just call EnumerableVar.AsParallel() and BAM multithreaded

.ForAll() not something else though?

.AsOrdered() will force ordered multithreading if that is needed

There are also parallel enumerables, which is similar to calling As Parallel on thing, but will also ensure that the resulting calls are done in parallel!

# Await

Await is basically a way of declaring "The code that follows me is a continuation".
