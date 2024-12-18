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
