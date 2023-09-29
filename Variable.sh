#!/bin/bash

#Refer https://tldp.org/LDP/abs/html/varsubn.html

# BASH VARIABLE

# ASSIGNMENT
# Variable being "naked" (no $ prefix) only when it's assigned.
# There are some ways to assign a variable in bash shell

# We don't need to declare variable in bash
echo notExistVariable:$notExistVariable

# Normal way
variable1=23
variable2= 23 # Notice spaces after '='
variable3 =4 # Notice spaces before '='

# Using result of other commands
whereAmI=$(pwd) && echo $whereAmI

# Using let for number
let num=20+4 && echo $num # let used for arthmethic

# In for loop
for a in 7 8 9 11
do
  echo -n "$a "
done

# In a read statement
echo -n "Enter \"a\" "
read a
echo "The value of \"a\" is now $a."

while IFS=' ' read -r a1 a2 a3 a4
do
    echo $a1
    echo $a2
    echo $a3
    echo $a4
done < <(echo el1 el2 el3 el4)

# BASH VARIABLES ARE UNTYPE, BUT ...
# Bash variables are character strings
# But, Bash permits arithmetic operations and comparisons as with integer number if the variable contains only digits

a=2334                   # All digits -> Can be operated like an integer.
let "a += 1"
echo "a = $a "           # a = 2335
echo                     # Integer, still.

# Calculate with text ?
b=12xy

let "b += 1"             # BB35 + 1
echo "b = $b"            # b = ?

# What about undeclared variables and null variables?
echo "undeclared = $undeclared"
let "undeclared += 1"
echo "undeclared = $undeclared"


