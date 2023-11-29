# Exercie 1: sequential Erlang
Define the following functions in Erlang:

- `is_palindrome: string → bool` that checks if the string given as input is palindrome, a string is palindrome when the represented sentence can be read the same way in either directions in spite of spaces, punctual and letter cases, e.g., detartrated, "Do geese see God?", "Rise to vote, sir.", ...;

- `is_an_anagram` : string → string list → boolean that given a dictionary of strings, checks if the input string is an anagram of one or more of the strings in the dictionary;
- `factors: int → int list` that given a number calculates all its prime factors;
- `is_proper: int → boolean` that given a number calculates if it is a perfect number or not, where a perfect number is a positive integer equal to the sum of its proper positive divisors (excluding itself), e.g., 6 is a perfect number since 1, 2 and 3 are the proper divisors of 6 and 6 is equal to 1+2+3;

# Exercise 2: Evaluating Expressions

This exercise asks you to build a collection of functions that manipulate arithmetical expressions. Start with an expression such as the following: ((2+3)-4), 4 and ~((2*3)+(3*4)) which is fully bracketed and where you use a tilde (~) for unary minus.

First, write a parser for these, turning them into Erlang representations, such as the following: {minus, {plus, {num, 2}, {num,3}}, {num, 4}} which represents ((2+3)-4). We call these exp s. Now, write an evaluator, which takes an exp and returns its value.

You can also extend the collection of expressions to add conditionals: if ((2+3)-4) then 4 else ~((2*3)+(3*4)) where the value returned is the “then” value if the “if” expression evaluates to 0, and it is the “else” value otherwise.

# Exercise 3: The Process Ring.

Write a program that will create N processes connected in a ring. Once started, these processes will send M number of messages around the ring and then terminate gracefully when they receive a quit message. You can start the ring with the call ring:start(M, N, Message).

There are two basic strategies to tackling this exercise. The first one is to have a central process that sets up the ring and initiates sending the message. The second strategy consists of the new process spawning the next process in the ring. With this strategy, you have to find a method to connect the first process to the second process.

Try to solve the exercise in both manners. Note, when writing your program, make sure your code has many io:format statements in every loop iteration; this will give you a complete overview of what is happening (or not happening) and should help you solve the exercise.

# Exercise 4: Ping Pong Server
Write a server that will wait in a receive loop until a message is sent to it. Depending on the message, it should either print its contents and loop again, or terminate. You want to hide the fact that you are dealing with a process, and access its services through a functional interface, which you can call from the shell.

This functional interface, exported in the echo.erl module, will spawn the process and send messages to it. The function interfaces are shown here:

- echo:start() ⇒ ok
- echo:print(Term) ⇒ ok
- echo:stop() ⇒ ok

**Hint:** use the register/2 built-in function, and test your echo server using the process manager.

**Warning:** use an internal message protocol to avoid stopping the process when you, for example, call the function echo:print(stop).

Then write a client to be connected to such a server and link these two processes each other. When the stop function is called, instead of sending the stop message, make the first process terminate abnormally. This should result in the EXIT signal propagating to the other process, causing it to terminate as well.

# Exercise 5: Counting Calls.

