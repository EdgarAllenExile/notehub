# Generics and Methods

You can make a method that accepts a generic, T, but also one that is constrained to only accepting types of T that implement a class or interface.

This will restrict to things that implement the same interface, in this instance, iComparable
```public class AGenericClass<T> where T : IComparable<T> { }```

Without the second `<T>` you are able to accept classes that implement the same base class:
```public class AGenericClass<T> where T : IComparable { }```
