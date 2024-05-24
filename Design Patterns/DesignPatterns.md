# Design Patterns

## What are Design Patterns

- Design Patterns are typical implemented solutions to commonly occouring problems.
- They are akin to blueprints that can be adapted and implemented to suit the needs of the progammer and code.


### Designs

- Patterns are designed to be predictable, repeatable and understandbale.
- They are described formally to in similar ways to ensure that they are easily understook and implemented.
- Design patterns follow the following structure.
  - Intent, what is the issue that the design pattern fixes and what sort of solution does it implement
  - Motivation, impact of issue and solution
  - Structure, classes of the pattern and how they are related
  - Code eample, showing an implementation of the pattern


### Types of Patterns

There are three types of design patterns:

- Creational patterns. Patterns that describe methods to create objects.
- Structural patterns. Patterns that describe how to assemble objects and classes into larger structures.
- Behavioural patters. Patterms that describe the communication and responsibility sharing between objects.


## Design Pattern Use Case

Design patterns are good for a variety of reasons.

* Code maintainability
  * Code that is structured and organised consistently promotes pattern recognition and enhances interpretation.
* DRY
  * Design patterns solve recurring problems. These solutions can be used throughout different parts of the application.
* Simplifying problems
  * Complex software problems can be broken down into smaller, more manageable components using design patterns. This simplifies development by addressing one problem.
* Scalability
  * Design patterns, particularly structural patterns, allow us to create a flexible and extensible architecture, making it easier to add new features or components.
* Testability
  * Design patterns can be modular. This allows easier testing of individual systems or components.
* Cross-platform development
  * Design patterns are language agnostic. They are just guidelines.
* Interaction
  * Design patterns provide a common language and a shared understanding among team members. They enable developers to communicate effectively and collaborate on software projects by referring to well-known design solutions.



# Creational Design Patterns

Creational design patterns ensure that a system operates independantly of how its objects are created, composed and represented. ????

Common creational design patterns include:

- Singleton pattern
- Factory method
- Abstract factory pattern
- Builder pattern
- Prototype pattern




## Singleton pattern

A Singleton ensures that there is only ever one instance of a class and provides an application with global access to this object.

- Singletons are commonly used to control access to a shared resource, such as a database or file.



It works by creating an object, then effectively calling that object when going to creating another instance of that object.

- This is not possible with regular constructor methods because they must return new objects by design.


Additionally, Singletons effectively create global variables that cannot be overwritten by additional code (like other global variables). 

### When to use

There are two situations to use Singletons

1. If your program should only have one instance of a class availabe for all clients, or
2. When you need strict control over a set of global variables.

### Implementation

Singletons have two common stages:

- Use a private constructor, so other objects cannot call a new instance of the singleton class
- Use a static creation method to 'act as' a constructor. This will inturn call the above noted private constructor and save it into the static field.
  - Allowing all subsequent calls to return this cached object.


#### Specific implementation steps

1. Add a private static field to the class for storing the singleton instance.
2. Declare a public static creation method for getting the singleton instance.
3. Implement “lazy initialization” inside the static method. It should create a new object on its first call and put it into the static field. The method should always return that instance on all subsequent calls.
4. Make the constructor of the class private. The static method of the class will still be able to call the constructor, but not the other objects.
5. Go over the client code and replace all direct calls to the singleton's constructor with calls to its static creation method.


#### Example Pseudo Code

```
Class Database
	private constructor method()
		// constructor method code
		// include actually getting the DB access etc
	public static method getInstance()
		// code saying "if instance is null, make new instance"
		// checks to see if instance was created in another thread
		// MUST RETURN Database.Instance
	public method doSomething(string)
		// This contains the actual body of what we want to do

class Application 
	method main()
		Database dbOne = Database.getInsance()
		dbOne.doSomething("string")
			// This has created the var dbOne, which allows you to deal with the Database as if it was a distinct object.
		Database dbTwo = Database.getInsance()
		dbTwo.doSomething("string")
			// This var dbTwo, is actually the same object as the one contained in dbOne, but we can deal with them in seperate ways.


```


### Cons

There are some issues with singletons

- Technically violates single responsibility because it does two things
- Can be problematic in multi-threaded environments
- Can be hard to test apparently


## Factory method

Factory methods provide an interface for creating objects. This 'super class' will allow 'sub-classes' to alter the type of object that will be created. Object creation is housed in a seperate method, promoting loose coupling between creation method and resulting object.  Useful when creating a varied array of objects, enabling increased flexibility at creation time.


### When to use

- Use a factory if there is a complex object creation process or if object creation varies depending on conditionals.
- Allows you to decouple client code from concrete classes.
  - Objects are created through interfaces (or abstract classes), abstracting the concrete classes and the client code
- When multiple variations are needed
  - Allows for a flexible way to accomodate variations by defining factory for each type
- When you want to allow customisation and configuration
  - Factories can be used to encapsulate configuration logic and allow clients to customize the creation process by providing params to the factory method
- Promotes code reusability because the creation of objects is centralised


### Implementation

In general, factory methods follow the same structure

1. The creator. An abstract class or interface that declares the factory method. Typically consists of a method that serves as a factory for creatng objects, can also include methods that work with said objects.
2. Concrete creator. Sublasses of the creator that implement the factory method to create objects. Each concrete creator is responsible for creating a particular product.
3. Product. The interface or abstract class for the objects that the factory method creates. the Product defines the common interface for all objects that the factory method can create.
4. Concrete product. The actual objects that the factory creates. Each concrete product class must implement or extend the Product interface or class.


### Example Pseudo Code

```
// Library classes
abstract class Vehicle {
    public abstract void printVehicle();
}

class TwoWheeler extends Vehicle {
    public void printVehicle() {
        System.out.println("I am two wheeler");
    }
}

class FourWheeler extends Vehicle {
    public void printVehicle() {
        System.out.println("I am four wheeler");
    }
}

// Factory Interface
interface VehicleFactory {
    Vehicle createVehicle();
}

// Concrete Factory for TwoWheeler
class TwoWheelerFactory implements VehicleFactory {
    public Vehicle createVehicle() {
        return new TwoWheeler();
    }
}

// Concrete Factory for FourWheeler
class FourWheelerFactory implements VehicleFactory {
    public Vehicle createVehicle() {
        return new FourWheeler();
    }
}

// Client class
class Client {
    private Vehicle pVehicle;

    public Client(VehicleFactory factory) {
        pVehicle = factory.createVehicle();
    }

    public Vehicle getVehicle() {
        return pVehicle;
    }
}
```

I am not 100% on the above. Geeks for Geeks changed around their naming conventions and I am confused. They do say the following though:


* **`Vehicle`** serves as the Product interface, defining the common method **`printVehicle()`** that all concrete products must implement.
* **`TwoWheeler`** and **`FourWheeler`** are concrete product classes representing different types of vehicles, implementing the **`printVehicle()`** method.
* **`>VehicleFactory`** acts as the Creator interface (Factory Interface) with a method **`<strong>createVehicle()`** representing the factory method.
* **`TwoWheelerFactory`** and **`FourWheelerFactory`** are concrete creator classes (Concrete Factories) implementing the **`VehicleFactory`** interface to create instances of specific types of vehicles.


### Cons

Not all rainbows and lollypops. Factory patters do have distinct drawbacks.

- Increased code complexity, adding new layers of classes, interfaces and abstractions.
- Tight coupling between product pairs. Changes to concrete creators still require changes to the concrete product.
- Testing can be annoying.


## Abstract factory pattern


## Builder pattern


## Prototype pattern



# Structural Design Patterns

Structural design patterns deal with how classes and objects fit in to the larger structures within a program.

Common structural design patterns include:

- Adapter pattern
- Bridge pattern
- Composite pattern
- decorator pattern
- Facade pattern
- Proxy pattern
- Flyweight pattern



## Adapter pattern


## Bridge pattern


## Composite pattern


## Decorator pattern


## Facade pattern


## Proxy pattern


## Flyweight pattern



# Behavioural Design Patterns

Behavioural design patterns are concerned with algorithims and the sharing of responsibility between objects.

Common behavioural design patterns include:

- Observer pattern
- Strategy pattern
- State pattern
- Command pattern
- Chain of responsibility
- Template pattern
- Interpreter pattern
- Visitor pattern
- Mediator pattern
- Momento pattern
