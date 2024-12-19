# Building Abstractions With Data

## Introduction

We have previously looked at how primitive data (numbers) and primitive operations (arithmetic) can be used and combined to do some fancy things.

Conducting logical reasoning by way of computational process is the essence of programming.

> [!NOTE]
> Data abstraction is the process of isolating the parts of a program that deal with how data objects are represented, from those that deal with how data objects are used.

The advantages of data abstraction is that it allows different procedures to apply irraspective of what the parameters of that procedure are. 

### Quickfire Notes

- Closure, the idea that data objects should be allowed to combine primative data types and also additional compound data types.
- Symbolic expression, data whose elementary parts are symbols and no numbers.
- Generic operations, those which take no set type.
- Data sentic programing, which is a technique that allows for individual data representations to be creatd seperately and added together.

## 2.1 Introduction to Data Abstractions

The principal of data abstraction is that programs should operate on abstract data. They should not make assumptions about the data being passed to them, other than what is strictly required. 

Conversely, a concrete data representation must also exist, which is independant of the program that uses the data. 

The intersection between these two parts is a set of procedures called selectors and constructors. These two procedures implement abstract data in the terms of concrete implementaion.

> [!NOTE]
> I think it is best to think of the intersection data abstraction as getters and settings in .NET. Your business logic deals with the data it expects to find when the program runs, whereas the data source is only serving raw numbers. The getters and settings meanwhile will take the raw data from the database and perform manipulations on it to get it into the form that your business logic expects. 

### 2.1.1 Exercise

This is where the basic forms of the expressions live that we will probably use all chapter.

The basic expressions here are abstract from the rational numbers (fractions) that we will use, because they do not know to expect fractions. 

The only thing that they know at this stage, is that they will take two objects, do something to them and work with the results.

As the all seeing programmer, we know that the procedures will decouple the rational numbers from their partners and deal with the results as basic bits. But the program doesn't. All it knows is that it takes the params, manipulates them and combines / subrtacts / sums / divides the results. 

A pair in LISP is exactly what it sounds like, and honestly I don't know why. But it can be used to create complex data structures. Two primative data elements combine to create the single compound pair. Pairs can be combined to create increasingly complex structures, known as list-structured data.

In the exercise, make-rat is the constructor, because it is constructing the pair.

The selectors are numer and denom becasue they deconstruct the data objects / select the data points.

### 2.1.2 Abstraction Barriers

In general, the idea is that with data abstraction, for each data object, you want to identify a basic set of operations that will perform all manipulations of that data. You want to express those manipulations for each type and only use those manipulations when using that type.

> [!TIP]
> This is why you inject an abstract type into your collectoins and then only use those defined methods with your type. Think about how the concurrent lists were quite limited in scope.


