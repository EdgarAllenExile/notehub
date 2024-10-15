# Big O Notation

## What Is Big O Notation, and Why Does That Matter
It describes the limiting behaviour of a function when the argument tends towards either a specific value, or inifinity. For search algo purposes, that is when tending towards a result?

Put simply, it describes the complexity of your code using algebra. Given maths' previously established dominance of the descriptive knowlege debate (chaper 1 of SICP notes), this is not surprising that our imperative instructions would be described using maths.

### Introduction Example
Take the following example: 
    0(n^2) 

In this statement, the following is true:
- It is pronounced Big O Squared
- The letter n represents input size
- and n^2 represents how complex the algorithim is with respect to the output size

An example of a 0(n^2) algorithim is selection sort. Which is when an algorithim iterates through a list to ensure that every element at index i, is the ith smallest / largest element in the list. Named because it first selects then sorts?

Take the following code snippet
``` Javascript
SelectionSort(List) {
  for(i from 0 to List.Length) {
    SmallestElement = List[i]
    for(j from i to List.Length) {
      if(SmallestElement > List[j]) {
        SmallestElement = List[j]
      }
    }
    Swap(List[i], SmallestElement)
  }
}
```

In this instance, the procedure takes a list as input, so the size of n is the number of elements inside the List. Assuming everything takes constant time, we could determine how fast the algorithim is by how many times the statements are exercised.

Given the inner most statement runs until i = list.length, we know that at least that portion will iterate as many times as the list has elements. This takes constant time, and if it was the only thing that was being calculated, then it would be O or big O speed.

However, each time the inner loop runs around once, it increments i and then goes again. Meaning that it runs 1+2+3...+N times. Which apparently equals n(n-1)/2 times. 

this is what we were using
https://www.freecodecamp.org/news/big-o-notation-why-it-matters-and-why-it-doesnt-1674cfa8a23c/
we are up to the first diagram.
