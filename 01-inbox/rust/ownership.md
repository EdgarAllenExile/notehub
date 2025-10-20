# Rust Ownership

This is Rust's most unique feature and enables Rust to make memory safe guarentees without a garbage collector. 

## What is Ownership?

Most languages either require direct intervention or a garbage collector to manage memory. Rust uses a third method, memory ownership. This is a serioes of compiler level checks to ensure memory is managed correctly. This is not done during running so it does not slow the program down, but rather, checks are done during compilation and if any do not pass, the program will not compile.

## The Stack and The Heap

Both the stack and the heap are parts of memory available at run time.

The stack stores values in a first in, last out approach. Adding data is called pushing onto the stack and removing data is called popping off the stack. All data on the stack must have a known, fixed size, otherwise it  goes on the heap.

The heap is less organised. Memory is requested by the program, a free spot is found by the allocator (ensuring it is big enough for the request) and the allocator returns a pointer, which denotes the address of that location on the heap. This is called allocating on the heap, or just allocating. Because a pointer is a known and fixed size, pointers can be stored on the stack, but when it comes time to retrieve the underlying data, the pointer must be used to retrieve from the heap. 

Pushing to the stack is faster than allocating on the heap, because there is no 'allocating' step. The location is always on the top of the stack. This is further complicated by the fact that to allocate on the heap, the allocating function must not only find the memory but then prepare it for the next allocation.

This is similar for retrieving data. The stack is faster because it's only ever in one spot. The heap must be parsed using the pointer to follow where to go. Generally, modern processors are faster when they do not need to jump around in memory. Processors are faster when they can work on data that is close to the existing data (like on the stack) as opposed to data further away (like on the heap).

When a function is called, the arguments that have been passed are pushed onto the stack (including pointers to the heap if that is relevant) and when the function has run, they are popped off. 

## How is Ownership?

Owenrship aims to solve the stack and heap diachotomy, but minimising the aount of duplicate data on the heap, cleaning when it is not used and ultimately manage heap data so that it does not run out of space.

## Rules of Ownership

Each value in Rust has an owner
There can be only one owner at a time
When the owner is out of scope, the value is dropped

## MOre Ownership

- When a value goes out of scope, Rust calls a special function called `drop`. `drop` effectively comes along and deallocates that memory. 
- if you set one var equal to another var, this creates a new pointer, but generally does not reallocate memory on the heap
    - If both vars then go out of scope, the program might call drop twice, which would not work because the memory has been deallocated already. This is called a double free error and is a memory saftey bug that can cause vulnerabilities.
        - To prevent double free issues, Rust deallocates the first var whenever it is used to define the second var. 
        - If you then attempt to use the first var again, you will get a compilation error.
- This works the other way around also, if you assign a different value to the same var, then the old value is removed and dropped from meory immediately.

### Shallow vs Deep Copy

- As noted above, most languages would call the pointer duplication a 'shallow copy' since it is only copying the pointer and not the data on the heap. 
    - Where as a deep copy would be also copying the heap.
- However in Rust we would call that a move, as the first var is being removed. Hence, we would say that the first var is being moved into the second.
- If you do need to do a deep copy in Rust, you could call the Clone method, but that seems to be for noobs.
    - Docs indicate that this is an expensive opperation.

### But what about things on the stack?

Conversely, data stored on the stack is much faster to retrieve than that on the heap and so it is fast to tpoy them. This means that both variables can be used and will not be dropped like they are above. 

This means there is not really any difference between shallow and deep copying things on the stack and cloning data does not really make sense. In that instance you would use `Copy` which means that it does not 'move' but is copied.

In general, types that implement the copy trait, are those that have fixed sizes, such as ints, bools, floats, chars and tuples composed ony of other copy-implementing types.

## Passing to a Function

Passing a var ot a funciton is similar to just assigning it. 

This means that you cannot pass a variable to a function and then use it again after that function call, as it would be out of scope and dropped (if it's a string or other heap-type). 

I feel this needs to be reiterated, if you pass a string to a function, that string is now gone. If you pass an INT though, you can then use it again. The string is stored on the heap and so by passing it, you have moved the pointer from one scope to another and dropped the first one. Conversely, the int is copied, since it is stored on the stack. This means that two versions of it exist on the stack and it can be used freely.
