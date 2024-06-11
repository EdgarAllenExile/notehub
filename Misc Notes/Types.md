# Types


## Generic Types


## Value Types

### Enumeration Types

An enumeration or enum is a value type defined by a set of named constants. 

They are declared similarly to other things, and look a little like this:

```
enum Season
{
    Spring,
    Summer,
    Autumn,
    Winter
}
```

They are basically indexed reference objects. Deconstructed with strictly int or numeric references, you can use them to do things like this:

```
public class EnumConversionExample
{
    public static void Main()
    {
        Season a = Season.Autumn;
        Console.WriteLine($"Integral value of {a} is {(int)a}");  // output: Integral value of Autumn is 2

        var b = (Season)1;
        Console.WriteLine(b);  // output: Summer

        var c = (Season)4;
        Console.WriteLine(c);  // output: 4
    }
}
```


You can also do cool things with extension methods I think, but that is not what I am checking out at the moment.


### Structure Types

Structure types, or structs, encapsulate data and functionality. 

A variable of a struct type contains an instance of that time (value semantics (not sure how relevant)).

Structs are used to design small, data-centric types that provide little or no behaviour. An example would be a boolean value, a unicode character or a time instance. If you need more functionality, use a class.

An example of a struct is as follows:

```
public struct Coords
{
    public Coords(double x, double y)
    {
        X = x;
        Y = y;
    }

    public double X { get; }
    public double Y { get; }

    public override string ToString() => $"({X}, {Y})";
}
```


### Tuple Types

A tuple type, or just a tuple, is a quick and easy way of grouping multiple data elements into a lightweight data structure.

See this nice example:

```
(double, int) t1 = (4.5, 3);
Console.WriteLine($"Tuple with elements {t1.Item1} and {t1.Item2}.");
// Output:
// Tuple with elements 4.5 and 3.

(double Sum, int Count) t2 = (4.5, 3);
Console.WriteLine($"Sum of {t2.Count} elements is {t2.Sum}.");
// Output:
// Sum of 3 elements is 4.5.
```


Like (for example) a javascript object, you can declare field names for tuples and use them in deconstruction. However, you can also let C# infer the field name.

You can deconstruct them in a whole bunch of different ways. Including using var, declaring the type of each variable, using existing variables etc. Here is an example using var:

```
var t = ("post office", 3.6);
var (destination, distance) = t;
Console.WriteLine($"Distance to {destination} is {distance} kilometers.");
// Output:
// Distance to post office is 3.6 kilometers.
```
