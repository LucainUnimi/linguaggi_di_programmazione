# Exercise 1
Put into a list, called alkaline_earth_metals, the atomic numbers of the six alkaline earth metals: beryllium (4), magnesium (12), calcium (20), strontium (38), barium (56), and radium (88). Then

- Write a function that returns the highest atomic number in alkaline_earth_metals.
- Write a function that sorts alkaline_earth_metals in ascending order (from the lightest to the heaviest).


Put into a second list, called noble_gases, the noble gases: helium (2), neon (10), argon (18), krypton (36), xenon (54), and radon (86). Then

- Write a function (or a group of functions) that merges the two lists and print the result as couples (name, atomic number) sorted in ascending order on the element names.

# Exercise 2

Beyond the well-known Celsius and Fahrenheit, there are other six temperature scales: Kelvin, Rankine, Delisle, Newton, Réaumur, and Rømer (Look at:

- Write a function that given a pure number returns a conversion table for it among any of the 8 scales.
- Write a function that given a temperature in a specified scale returns a list of all the corresponding temperatures in the other scales, note that the scale must be specified.

**Hint** Define a proper datatype for the temperature.

# Exercise 3
Write the matrix datatype with the following operations:

- A function zeroes to construct a matrix of size n×m filled with zeros.
- A function identity to construct the identity matrix (the one with all 0s but the 1s on the diagonal) of given size.
- A function init to construct a square matrix of a given size n filled with the first n×n integers.
- A function transpose that transposes a generic matrix independently of its size and content.
- The basics operators + and * that adds and multiplies two matrices non necessarily squared.

# Exercise 4

Let's write a function (or a pool of functions) that given a quite large text (over than 2000 words) counts how frequent each word occurs in the text.

The text is read from a file (look at the pervasive module in the manual) and it is a real text with punctuation (i.e., commas, semicolons, ...) that should be counted.

**Note** that words with different case should be considered the same.

# Exercise 5

Define the following functions/operators on strings:

- is_palindrome: string → bool that checks if the string is palindrome, a string is palindrome when the represented sentence can be read the same way in either directions in spite of spaces, punctual and letter cases, e.g., detartrated, "Do geese see God?", "Rise to vote, sir.", ...
- operator (-): string → string → string that subtracts the letters in a string from the letters in another string, e.g., "Walter Cazzola"-"abcwxyz" will give "Wlter Col" note that the operator - is case sensitive
- anagram : string → string list → boolean that given a dictionary of strings, checks if the input string is an anagram of one or more of the strings in the dictionary
