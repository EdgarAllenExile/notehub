# Structural Components - C# Centric View

### Namespaces

Namespaces organise its classes.

- Example: `<System.Console.Writeline("Hello World")>`
  - System is a namespace,
  - Console is a class within that namespace,
  - WriteLine is the method called from the class.

A "using" statement lets you get around needing to declare the full namesace.class.entity.

Declaring your own Namespace lets you organise classes in yout own outlined structure.

### Classes

Classes are reference types, that is they are null until initiated with the `new` operator.

- Classes define types of objects. Once a new instance of a class is declared, that becomes an object.
  - Objects are concrete objects, based on a class.
- Reference type being defined because objects are created with *reference* to classes. Hence reference type.

Classes support inheritance.

- Inheritance is enabled by declaring a base class when definining the new class that is being created.
  - This is done through the use of a colon eg:
    - `public class Toast : Bread`
      - methods are defined for the Toast class, however it will also receive all methods from the Bread class.

Classes can only inherit one base class, however since that base class can inherit its base class, it is possible to string them together.

- This is especially common with interfaces.

### Interfaces

An interface is an abstract class(?) that defines a set of related functions that a class or struct must implement.

- These can be static methods that contain an implementation,
- They can make certain implementations default behaviours.

Interfaces cannot decalare INSTANCE data, such as fields, auto-implmented properties or property like events.

- To get around this, consider using `EF.Property<datatype> ` as I believe this gets around this.
  - NB: Check that the method you want to call is available on the data type are telling EF to expect.

Any class or struct that implements an interface must then inturn implement all declared 'members' (functions / methods / etc) of that interface.

- This does not apply to inherited interfaces. That is, if you apply an interface to a base class and derive a new class from it.

You cannot create an instance of an interface directly. To use the functionality, you must implement the members through a class or struct.

#### Poetic Musings

Interfaces are hard typed in C#, however they are not in other languages and do not need to be. The Interface is the client facing API portion of a component. Anything in a program that does work has a corrasponding interface, even if it is not known as such (in c#). 

A function has an "interface", which is its signature. The signature defines the return type and the parameters the function accepts. Interfaces do not have any special powers, they only define how existing code would interact with an object or the wider program. The interface is used to seperate this "contract" (between component and program) from the internal working of the component.

#### Questions and Comments

Apparently you can delegate the implementing of an interface's methods to child classes / objects / components??

### Dependancy Injection - Does this live here or in Design Patterns??

Dependancy injection is a pattern in which an object or method supplies the dependancies of another object at run time. These dependacies or services dictate *something about the parent object.*

The dependancy injection handles the creation of the objects, the classes relating to the objects and the provisioning of the classes to the objects.

- If there are any changes to be made to the objects, it is the responsibility of the injection pattern to provide the objects the new classes.

## Annoying words that seem to keep cropping up

Overloads

Contract - Domain Layer

Lambda
