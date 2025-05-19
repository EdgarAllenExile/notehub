# Generics and Methods

You can make a method that accepts a generic, T, but also one that is constrained to only accepting types of T that implement a class or interface.

This will restrict to things that implement the same interface, in this instance, iComparable
```public class AGenericClass<T> where T : IComparable<T> { }```

Without the second `<T>` you are able to accept classes that implement the same base class:
```public class AGenericClass<T> where T : IComparable { }```

## Methods that Return Interfaces

If you have an Async Task returning method, that method can return a concrete class that implements an interface if you do something like this:

`public asyn Task<IClass> Method()`

From within this method you can then go through and init an object from a class that implements `IClass` and return it.

Why can you not do thhis otherwise? No idea.
