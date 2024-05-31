# Structural Design Patterns

Structural design patterns deal with how classes and objects fit in to the larger structures within a program.

Common structural design patterns include:

- Adapter pattern
- Bridge pattern
- Composite pattern
- Decorator pattern
- Facade pattern
- Proxy pattern
- Flyweight pattern

## Adapter pattern

An adapter pattern allows objects with incompatible interfaces to collaborate.

An adapter is a special object that converts the interface of one object so that annother interface can understand it. This can be useful in situations in which legacy parts of programs have been imported and still need to be used.

Can also be used when you would like to reuse classes or components with interfaces that are incompatible with the interfaces expected by the existing code.

Can also act as a bridge for making different interfaces work together correctly, can be especially helpful when using imported third party APIs or libraries which present with different inerfaces than the existing ones on the system.

### Implementation

There are four major components required for an adapter pattern:

1. Target interface. The interface used by the Client and represents the set of operations that the client code can use.
   1. It acts as the common interface that the client code interacts with
2. Adaptee. The existing class or system with an incompatible interface that must be implemented
   1. It acts as the class or system that the client code would like to use but cannot due to interface mismatch.
3. Adaptor. A class that implements the target interface and internally uses an instance of the adaptee to make compatible.
   1. It acts as the bridge adapting the interface of the adaptee to match the target interface.
4. Client. The code that will use the target interface to interact with objects.
   1. It is the code that benefits from the integration of the adaptee into the system through the adapter.

When it gets down to it, the design pattern follows four man steps:

1. Client request is initiated by calling a method on the adapter using the target interface
2. The adaptor translates or maps the client's request into a form that the adaptee understands, using the adaptee's interface
3. The adaptee performs the actual work based on the translated reques from the adapter
4. The client receives the results of the call, remaining agnostic to the adapters presence or the specifics of the adaptee

#### Example

```


// Adapter Design Pattern Example Code
 
#include <iostream>
 
// Target Interface
class Printer {
public:
    virtual void print() = 0;
};
 
// Adaptee
class LegacyPrinter {
public:
    void printDocument() {
        std::cout << "Legacy Printer is printing a document." << std::endl;
    }
};
 
// Adapter
class PrinterAdapter : public Printer {
private:
    LegacyPrinter legacyPrinter;
 
public:
    void print() override {
        legacyPrinter.printDocument();
    }
};
 
// Client Code
void clientCode(Printer& printer) {
    printer.print();
}
 
int main() {
    // Using the Adapter
    PrinterAdapter adapter;
    clientCode(adapter);
 
    return 0;
}
```

The expected output of this code would be "Legacy Printer is printing a document."

## Bridge pattern

Similar to an adapter in intent, the bridge pattern seperates an abstraction from its implementation. This can promote loose coupling between class abstractions and implementations.

There are two parts to a Bridge design pattern abstraction and implementation.

- The bridge pattern allows both of these parts to be developed independantly of each other. The client code only needs to access the abstraction portion of the code without concerning itself with the implementation.
- The abstraction is done in an interface or abstract class, with the implementor also being an interface or class.
- The abstraction contains a reference to the implementor. Children of the abstraction are referred to as refined abstractions. Children of the implementer are concrete abstractions.

You should use a bridge pattern because:

- It decouples an abstraction from its implementation so that the two can vary independantly
- You are developing a platform independant feature
- Lets you stick an abstraction interface in

### Implementation

There are four elements involved when using a bridge pattern.

1. Abstraction. This is the core of the bridge pattern and defines the crux. Contains a reference to the implementor.
2. Refined abstraction. Extends the abstraction and digs into the finer details. Hides those details from the implementors.
3. Implementor. Defines the interface for the implememtation classes. Does not need to correspond directly to the abstraction interface and can be very different.
4. Concrete implementor. Implements the above implementor by providing the concrete implementor.

#### Example

```
// Java code to demonstrate
// bridge design pattern

// abstraction in bridge pattern
abstract class Vehicle {
	protected Workshop workShop1;
	protected Workshop workShop2;

	protected Vehicle(Workshop workShop1, Workshop workShop2)
	{
		this.workShop1 = workShop1;
		this.workShop2 = workShop2;
	}

	abstract public void manufacture();
}

// Refine abstraction 1 in bridge pattern
class Car extends Vehicle {
	public Car(Workshop workShop1, Workshop workShop2)
	{
		super(workShop1, workShop2);
	}

	@Override
	public void manufacture()
	{
		System.out.print("Car ");
		workShop1.work();
		workShop2.work();
	}
}

// Refine abstraction 2 in bridge pattern
class Bike extends Vehicle {
	public Bike(Workshop workShop1, Workshop workShop2)
	{
		super(workShop1, workShop2);
	}

	@Override
	public void manufacture()
	{
		System.out.print("Bike ");
		workShop1.work();
		workShop2.work();
	}
}

// Implementer for bridge pattern
interface Workshop
{
	abstract public void work();
}

// Concrete implementation 1 for bridge pattern
class Produce implements Workshop {
	@Override
	public void work()
	{
		System.out.print("Produced");
	}
}

// Concrete implementation 2 for bridge pattern
class Assemble implements Workshop {
	@Override
	public void work()
	{
		System.out.print(" And");
		System.out.println(" Assembled.");
	}
}

// Demonstration of bridge design pattern
class BridgePattern {
	public static void main(String[] args)
	{
		Vehicle vehicle1 = new Car(new Produce(), new Assemble());
		vehicle1.manufacture();
		Vehicle vehicle2 = new Bike(new Produce(), new Assemble());
		vehicle2.manufacture();
	}
}

```

The expected output of the above would be :

Car Produced And Assembled.

Bike Produced And Assembled.

## Composite pattern

## Decorator pattern

## Facade pattern

## Proxy pattern

## Flyweight pattern
