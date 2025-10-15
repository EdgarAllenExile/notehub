# Abstract Keyword

Abstract (usually class) in c# generally means that hte thing that is being modified or worked with has a missing or otherwise incomplete implementation. 

This can actually be used with classes, methods, properties, indexes and events, but usually it seems to just be classes.

You can provide an abstract class with both abstract methods, like those in interfaces, which must be implemented or overridden in derrived classes, or fully implemented members. The difference between these being if the method has a body / can do any identifiable work based on the abstract class. This allows for both shared functionality (fully implemented member) and novel but matching functionality (abstract member) to be passed to derrived classes.
