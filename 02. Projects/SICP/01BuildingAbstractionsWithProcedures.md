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

## Square Roots and Mathematical Functions
Computer programs must be effective, where as mathematical procedures can be descriptive. The mathematical function "The square root of x is such that y (is above 0) and y^2 equequals x" is perfectly valid. However is of no use to a computer. Computers concern themselves with finding answers and being given instructions. The above quote is a complete description of what the square root of x should be, but it is not a set of instructions on how to find it.

> [!NOTE] Note 
> This can be referred to as the difference between declarative knowledge and imperative knowledge. 
> Mathematics concerns itself with the description of a thing, where as computer science concerns itself with instructions on how to do a thing.

### Actually Finding The Square Root
Actually finding the square root of a number is done by using newton's method of approximations. Where we have x, then we guess a number y. We then take x / y and average it with Y. We continue doing this until we get to a close enough match. Replacing y with the first result each time.

To translate this to computer procedure, we take the radicand (the number which we are trying to find the square root of) and a value for a guess. If the guess is good enough, we are done. If not we keep going. If you constructed this as a procedure, you could use a logic statement, however it is more fun to use recursion. Apply the function a normal, then when you are done, use an if statement to test if it meets the given tolerance, if not, call the function again using the new value for y (the result of the average of x/y and y).

[!note] Note 
This was actually invented by Heron of Alexandia in the 100CE.

## Scope - Procedures as Black Boxes
Procedures are allowed to be recursive, that is, defined with refernce to themselves. 

Seeing as procedures are implcititly a collection of steps, it makes sense that you are able to abstract away some of the steps. This is where calling other procedures enters.

[!Note]
Each procedure must accomplish an identifiable task that can be used as a module within another procedure.

When we use other procedures this way we are employing them like black boxes. We do not care what the content of the procedure is, only that it returns what we want. Given the square root procedures mentioned above, it is immaterial how the square is calculated, these details can be supressed. As far as the procedure calling the square function is concerned, square is not even a procedure, it is an abstaction of a procedure. It is calling the value that results from the function. Thisa iscalled procedural abstraction.

Procedures suppress detail in this way and allow for cleaner code.

### Scope
An implication of this, is scope and bound variables. The abstracted procedure does not know what the initial procedure calls its variables, it cannot know this. They are passed as values to the procedure, who in turn will bind them to the formal parameters that it knows. This allows named variables to have consistent values across the entire program.

A formal parameter's name is immaterial to the function. This parameter is turned into a bound variable when the procedure is called, with the passed parameter becoming bound to the value. If the variable is not bound, we would call it a free variable. The section of code for which the variable is bound is known as that variable's scope.

In this instance, the scope is the procedure. However we could call other free variables such as internal functions like square or maths functions. There can be issues with renaming system functions, but I don't really know if that will be relevant. To avoid constantly nesting procedures that ultimately are abstracted away from a thirdparty observer, we can create scoped procedures, or internally defined procedures local to the larger procedure. This is called block structure and is the solution to the name package problem. This allows us to only define the input variable (x) at the top of the procedure and so not need to define it as a formal param of the later procedures.

This idea is called lexical scoping.

Block structures are good to breakup large programs into manageable chunks.

## 1.2 Procedures and the Processes They Generate
To become an expert programmer, you must be able to visualise the processes generated by various different types of procedures. 

> [!Note]
> A procedure is a pattern for the local ecolution of a computer process. It specifies how each stage of the process builds upon the one that came before it.

When you go to develop a procedure, you must account for the shape that they will possess. If you were to calculate a factorial by reference to the fact that n! = n* (n-1)! then we might attempt to calulate it by starting at n and multiplying n by n-1 until such that n = 1. You could draft this procedure by first checking if n = 1 and if not, multiplying the result of factorial n - 1 by n, until such a time that n = 1. This means that until n = 1, you would be putting multiplication steps onto the stack. Once n = 1, you go back through and use the resulting value of n to resolve it. Effectively, you are adding a multiplication step onto the sctack for everytime n != 1 and then iterating through them. Retrieving the value of the preceding recursive call each time. 

Another way to do it, would be to create a counter, and iterate upwards each time, starting at 1 until the counter equals n. This would be a more linear form of recursion as we are not adding anything to the stack.

> [!Note]
> In the first example, since the recursive call has not resolved before it is called again, we call this a chain of deferred operations. A chain of deferred operations generally is called a recursive operations. It requires the interpretter to keep a treack of the performed operations and the operations to perform. In this situation, the number of operations grows linearly to the value of n and we call it a linearly recursive process.

> [!Note]
> In the second example, the procedure is still recursive, as it calls itself. However we are able to determine at what stage of the process we are at, due to the counter. This is called an iterative process, and ischaracterised by being summarised by the state variable (counter). It must also include a fixed rule for when the state is satisfied and the process should end. This also grows linearly, so we call it a linear iterative process.

> [!todo]
> Are recursive equations only ones that delay the resolution until the checkpoint is reached? Or are all processes that call themselves resursive? If you iterate over something looking for a value is that abstracted recusion?

> [!Note]
> To answer the above, there is a distinction between recursive processes with recursive procedures. Recursiv procedures refer to the syntactic fact that the procedure definition refers to the procedure itself (the function calls itself). Recursive processes, refer to how the process evolves, not how it is written. The first example is recursive process because it builds up anticipatory steps, until colapsing in on itself.

Calling the first procedure iterative feels wrong, however it is effectively a homebrew way of creating a looping construct. Many languages' looping constructs are memory inefficient, however scheme and others ensure they use constant space. This is called tail recursive implementation.

### Tree Recursion
This is a particularly interesting way to illustrate process recursion, espcially with the fibonacci example. It works be adding fib n-1 and n-2 (unless n is 0 or 1). So if you take n = 5, you want to work out fib 5 - 1 and fib 5 -2. To work this out you must work out fib 4 - 1 and fib 4 - 2. Thus these different steps are put on the stack until both other terms resolve. In this example it is when n = 1 or 0. Seeing how each iteration of the recursive pattern calls fib twice, this adds two branches to the tree that is made, except the last one where n = 1 or 0 is resolved.

A tree recurisve pattern however is not efficient, as the amount of steps grows exponentially with the value of n (because each increment of n requires the bulk of the calculations to be recalculated, and each new increment adds two new top level calculations). Space however only grows linearly, because we only need to keep track of which nodes are above us in the process. 

A linear method of calculating this same equation would just have a = a + b and b = to a, then decrement until 0. This requires a linear amount of steps as we are simply going one calculation at a time until our counter is 0.

#### Counting Change
Applying our tree recursive pattern to a new example, we can see that the number of different ways to make change with a given amount of coins is equal to all of the different ways to make change using all but the first coin AND all of the different ways that DO use the first coin. Therefore, we can take this and apply additional iterative steps to it and go through the different types of coins. 

[!todo]
Did not do the exercises here as maths is hard. Should also check 1.14-15 and I am not fully sure I understand space.

### Orders of Growth
One way to compute the gross measure of the resources required by a process is the order of growth. If n is the size of the problem and R(n) is the amount of resources to calcualate it. This could really be anything, such as the specificity required to calculate decimals. 

We say that R(n) has order of growth theta of f(n). In our linear recursive process for doing factorials, the number of steps required grows proportionally to n, thus the steps required grows as theta n and so does the space required. For the iterative process, the steps required is still theta n (linear) however the space required is constant, so theta 1. The tree recursive fibonacci sequence requires theta (golden ratio^n) steps and space theta n.

Whilst this is only a very approximate and rough understanding, it is useful to be able to use. For example, a linear process (theta (n)) doubling the size doubles the resources used. Exponential processes multiply the resource utilization by a constant amoutn each time. 

### Exponention
Processes that are linear and do not defer opperations or place things on the stack, are space theta one. Because they occupy constant space.

        I was thinking about this the wrong way around. `O(log n)` is actually preferred over constant growth `0(n)` in most situation becaue the x axis grows way way slower than the y axis. If you are calculating the exponent of a number. Actually I am not sure about this and will have to return to it.

 -- Not sure how I managed to indent that entire paragraph...

-- at this point I feel that I should leave the maths sections behind and keep going with the programming portion. Hence I am skipping these exercises and moving to 1.2.5

### Greatest Common Divisor
To find the GCD of a number, you could start by taking the factors of a number and finding the highest one, but i is simplest to use Uclid's Algorithm, which is that `a % b = r = a % r = bL:` 
