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
