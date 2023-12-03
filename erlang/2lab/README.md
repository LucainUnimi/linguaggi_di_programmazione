# Excercise 1: List comprehensions

Write the following functions by using list comprehensions:

- `squared_int` that removes all non-integers from a polymorphic list and returns the resulting list of integers squared, e.g., squared_int([1, hello, 100, boo, “boo”, 9]) should return [1, 10000, 81].
- `intersect` that given two lists, returns a new list that is the intersection of the two lists (e.g., intersect([1,2,3,4,5], [4,5,6,7,8]) should return [4,5]).
- `symmetric_difference` that given two lists, returns a new list that is the symmetric difference of the two lists. For example symmetric_difference([1,2,3,4,5], [4,5,6,7,8]) should return [1,2,3,6,7,8].

# Exercise 2: Distributed Associative Store.
Design a distributed version of an associative store in which values are associated with tags. It is possible to store a tag/value pair, and to look up the value(s) associated with a tag. One example for this is an address book for email, in which email addresses (values) are associated with nicknames (tags).

Replicate the store across two nodes on the same host, send lookups to one of the nodes (chosen either at random or alternately), and send updates to both.

Reimplement your system with the store nodes on other hosts (from each other and from the frontend). What do you have to be careful about when you do this?

How could you reimplement the system to include three or four store nodes?

Design a system to test your answer to this exercise. This should generate random store and lookup requests.

# Exercise 3: Master and Slave.
This problem illustrates a situation where we have a process (the master) which supervises other processes (the slaves). In a real example the slave could, for example, be controlling different hardware units. The master's job is to ensure that all the slave processes are alive. If a slave crashes (maybe because of a software fault), the master is to recreate the failed slave.

Write a module ms with the following interface:

- `start(N)` which starts the master and tell it to start N slave processes and registers the master as the registered process master.
- `to_slave(Message, N)` which sends a message to the master and tells it to relay the message to slave N; the slave should exit (and be restarted by the master) if the message is die.
- the master should detect the fact that a slave process dies, restart it and print a message that it has done so.
- The slave should print all messages it receives except the message die


**Hints:**

the master should trap exit messages and create links to all the slave processes.
the master should keep a list of pids of the slave processes and their associated numbers.
Example:

> ms:start(4).

=> true

> ms:to_slave(hello, 2).

=> {hello,2}

Slave 2 got message hello

> ms:to_slave(die, 3).

=> {die,3}

master restarting dead slave3

# Excercise 4: Distributed Reverse String

To reverse the order of the characters in a string is quite trivial but when the length of the string grows trivial could means extremely slow. To decompose the input string in shorter strings and to join back the inverted strings in order to keep the algorithm working always on a short input is a good idea to fast the process.

Write a master-slave (see the previous exercise) distributed system where:

- a server process (MasterProcess) provides a service called long_reverse_string() that given a very large string (≥ 1000 characters) returns the reversed string;
- the service long_reversed_string() decomposes the input w into 10 strings w⁰, ..., w⁹ with the following lengths (# represents the operator length of a string, and n=#w%10): #w⁰=...=#wⁿ=#w/10+1 e #wⁿ⁺¹=...=#w⁹=#w/10 and forwards to 10 distinct actors (SlaveProcess) to reverse the 10 substrings w⁰, ..., w⁹ (service reverse_string()) and joins the 10 results.
- the client process (ClientProcess) just ask for the service on a given string.
When done with the exercise try to relax the constraint on the number of substrings from ten to a generic M passed as an input to the long_reversed_string service.

# Excercise 5: IRC lite P2P
Consider the IRC lite application shown in the lectures and re-engineer it to support a more peer-to-peer architecture where each client is connected via a socket to all the other clients that join to the same IRC channel.

Note that also joining/unjoining could be dealt in a peer-to-peer fashion by sending the message (both joining or unjoining) to a client which propagate the action to the other clients.
