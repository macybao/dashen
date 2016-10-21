## Chapter 2 Analysis
####Difference between **Algorithm** and **Program**:
***Algorithm:***  generic, step-by-step list of instructions for solving a problem.

***Program:***  an algorithm that has been encoded into some programming language. There may be many programs for the same algorithm, depending on the programmer and the programming language being used.

> Two different functions solve the same problem:
>
```
def sumOfN(n):
   theSum = 0
   for i in range(1,n+1):
       theSum = theSum + i
   return theSum
print(sumOfN(10))
```
>
```
def foo(tom):
    fred = 0
    for bill in range(1,tom+1):
       barney = bill
       fred = fred + barney
    return fred
print(foo(10))
```


#### Algorithm Analysis
> concerned with comparing algorithms based upon the amount of **computing resources** that each algorithm uses.

#### Computing Resource
> * the amount of space or memory an algorithm requires to solve the problem.
> * amount of time they require to execute.
> 	* Benchmark Analysis
> 
> ```
> import time
> 
>	def sumOfN2(n):
>		start = time.time()
>   	theSum = 0
>   	for i in range(1,n+1):
>			theSum = theSum + i
> 			end = time.time()
>   return theSum,end-start
> ```

### Big-O Notation

### Anagram Detection Example
> **Anagram:**  an anagram of another if the second is simply a rearrangement of the first. E.g. `'heart'` and `'earth'` are anagrams. 

**goal:** to write a boolean function that will take two strings and return whether they are anagrams.

**1. Checking Off**
> check to see that each character in the first string actually occurs in the second 




 