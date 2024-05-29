# Concepts You Should Know

## Generic

### Concrete vs Abstract

A concrete object is the class or method that allows for the instantiation of a new object. It is the class or method that actually contains the code that will effectively do the work required to get the object up and running.

Effectively the reverse of a concrete object, an abstract class cannot be instantiated and exists only for concrete classes and objects to implement.

#### Concrete objects

There are two main uses of the word concrete in programming, concrete classes and concrete methods.

Concrete class is a class that allows for the creation of an object through the use of the new keyword.

Concrete methods are methods that can be called directly.

In either case, the concrete object must implement all inherited methods and properties from its abstract parents.

#### Abstract Objects

Abstract classes are inherited by concrete classes and their methods must be inherited by their implementees.


#### Code Example

```
 public abstract class Animal
    {
        public abstract void Talk();
        public abstract void Move();
    }

    public class Human : Animal
    {
        public override void Talk()
        {
            Console.WriteLine("This blog post is awesome! :)");
        }

        public override void Move()
        {
            Console.WriteLine("I'm walking on 2 feet.");
        }
    }

    public class Dog : Animal
    {
        public override void Talk()
        {
            Console.WriteLine("Woof! WOOF!");
        }

        public override void Move()
        {
            Console.WriteLine("I'm walking on 4 feet.");
        }

    }
```



### Tight Coupling

Tight coupling occours when a class is dependant on a concrete dependancy. Meaning that changes in one object must be reflected on the other object.

### Loose Coupling

Loose coupling occours when two objects are independant and each object can use one and other independantly


### Inversion of Control

Inversion of control means that a component is 'given' its dependant data sources, services and configurations as opposed to needing to go and find them.


### Dependancy Injection

Pushing dependancies of an objecct into constructor functions, as opposed to that object needing to go and get them itself.
