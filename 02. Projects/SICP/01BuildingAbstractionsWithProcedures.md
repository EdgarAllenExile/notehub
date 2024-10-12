# Chapter 1
The world has too many bible salesmen. Keep computer programming fun.

## Elements of Programming
Language is very important for how we describe the actions a computer is performing. 
- Primitive expressions, represent the simplest entities that a language is concerned with
- Means of combination, by which compound elements are build from simpler ones
- Means of abstraction, how we deal with those compound elements and manipulate them as units

A primitive expression would be a number, adding those numbers together is a means of combination and defining that as a function is abstraction.

In mathematic expression, the symbol is the operator and the numbers are the operands.

Recursion at its most simple is a process of evaluation that involves the function calling itself.

A compound procedure differs from a primitive procedure because you first must define the procedure, and then use it. If you define a function that squares a number, this will constitute a compound procedure. This is true even if when you go to call this procedure, it does not differ in form to a primitive procedure. The only way to distinguish them at this stage is to know that this is beyond the scope of the functions built into the interpretter. Such as + _ *.

## Models of Procedure evaluation
There are several different ways to evaluate procedures.

The two easiest ways to think about it are substitution and the other one

### Substitution
Substitution method describes a method of evaluation an expression that has the passed values substitute the formal parameters when required.
It can be easiest to think of substitution method as replacing each formal parameter by its corresponding argument from the outset.
- This can be thought of as evaluating the meaning of a method, in so far as procedures can have meaning."

## Applicative Order vs Normal Order
One method of thinking about the order of operations for programs, is the interpreter first evaluating the operator and operands, then applying the procedure to the arguments. Another way to think about this is to only evaluate the parameters once they are needed. This method would iterate through the different procedures (using the parameters as placeholders) until such a time that it was only looking at an expressing using primitive operators. Then it would perform the operation. 

This method of waiting until such a time as there is only a primative value left on the stack is called normal order operation, as oppsed to the evaluate the arguments then apply method that the interpreter actually uses which is called applicative order evaluation. 

### Example
The example from the book is using a method that takes two values, a and b. It adds 1 to a and 2 to b, squares them and then adds them together.
- The Applicative Order of evaluating this would first replace a and b with their passed values, then add one and two, then square them, then add them together.
- The Normal Order would evaluate the expression sum-of-squares, but effectively placing the sum operation on the stack, then the squaring operating on the stack (both times using the param as a pending value). 
    - When the square operation is placed on the stack, this 'spawns' two sets of addition operations (becuase the value to be squared has not yet resolved). 
    - At this point it would encounter a + 1 and b + 2 (twice, because they are squared). 
    - Once it reaches this point, it would add a + 1 and a + 1 AND b + 2 and b + 2. These values would then be used to resolve the next operation on the stack.

## Conditional Expressions and Predicates
Logic tests in LISP are known as case analysis. We use (cond xyz) to show this. 

The general form of a conditinal expression is the symbol cond followed by parenthesized pairs of expressions. Called clauses and commonly given the names p and e. Hence (cond (p) (e)). The p value in this situation is called the predicate. The resolution of the second value, is predicated on the first value returning true or false. 

This cond evaluation is much like a chain of bool statements. e is only resolved once p returns true, so a cond statement will use a chain of p statements, waiting for one to return true.

The word predicate in this context, is used for expressions that return true or false.

abs or absolute covers value comparison statements. It uses the primitive predicates < > = to determine if val a is < > or = val b and returns true or false depending.

Then there is the if statement, which is effectively a ternary. It takes the predicate, consequent and alternative. Consequent is e for some reason. Evaluation? 

Then there is and or not, which I think are the same as Excel's versions of these functions.
