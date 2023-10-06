#!/bin/bash

#Refer https://tldp.org/LDP/abs/html/varsubn.html
# VARIABLE SUBSTITUTION
# Get value of variable = variable substitution, using ${var}
echo variable1
echo var1:${variable1}
echo var1:$variable1  # $var is shortcut of ${var}
echo var2:$variable2
echo var1:"$variable1"   # Double quote is partial quoting, means that the variable substitution is proceeded normally in the qoute
echo var1:'$variable1'   # Single qoute is full quoting, no variable substitution   
variable3=$variable1
#$variable3=$variable1

stringWithSpace="A  B       C"
echo $stringWithSpace   # echo A  B       C
echo "$stringWithSpace" # echo "A B       C"
# --> Why it output different result?
# Interesting point!
IFS='_' && echo $stringWithSpace  # What 's the result'
unset IFS

# PARAMETER SUBSTITUTION AND EXPANSION
Offer=100
# If you don't have expected salary
salary=${expect:-$Offer} && echo "Your salary: $salary"
# If you have expected salary, but it's empty 
expect=
salary=${expect:-$Offer} && echo "Your salary: $salary"
# If you have an expected salaray :)
expect=200
salary=${expect:-$Offer} && echo "Your salary now: $salary"

# STRING OPERATIONS
# Refer https://devhints.io/bash

myString="Hello"

# ${#string}	Length of $string
echo "myString have ${#myString} characters"

# ${string:position}	Extract substring from $string at $position
pos=2
echo "Substring of ${myString} from position ${pos} is ${myString:$pos}"

# ${string:position:length}	Extract $length characters substring from $string at $position
# [zero-indexed, first character is at position 0]
pos=2
length=3
echo "Substring with length $length of $myString from position ${pos} is ${myString:$pos:$length}"
# Substring from the right 
# Notice the () around $pos for negative value
pos=-2
length=2
echo "Substring $length characters from the right position $pos: ${myString:($pos):$length}"

# ${foo#prefix}	Remove prefix
prefix=He
echo "Remove prefix $prefix of $myString is ${myString#$prefix}"
# ${foo/#from/to}	Replace prefix
echo "Replace suffix $prefix of $myString by xx is ${myString/#$prefix/xx}"

# ${foo%suffix}	Remove suffix
suffix=lo
echo "Remove suffix $suffix of $myString is ${myString%$suffix}"
# ${foo/%from/to}	Replace suffix
echo "Replace suffix $suffix of $myString by xx is ${myString/%$suffix/xx}"

# ${foo/from/to}	Replace first match
echo "Repace first match of \"l\" in $myString by \"x\": ${myString/l/x}"

# ${foo//from/to}	Replace all
echo "Repace all match of \"l\" in $myString by \"x\": ${myString//l/x}"

# LOWERCASE AND UPPERCASE
str="HELLO WORLD!"
echo "${str,}"   #=> "hELLO WORLD!" (lowercase 1st letter)
echo "${str,,}"  #=> "hello world!" (all lowercase)

str="hello world!"
echo "${str^}"   #=> "Hello world!" (uppercase 1st letter)
echo "${str^^}"  #=> "HELLO WORLD!" (all uppercase)

#========================================================================
# Some real examples

path=/c/Users/70k1537/Documents/Work/TrainingSample/log_0001.text
# How to get driver letter c
# How to get folder path : /c/Users/70k1537/Documents/Work/TrainingSample
# How to get file name
# How to get the extension
# How to get file name without extension
# How to get the index number 0001

string="BASH SHELL IS EASY"
# Make it become "Bash shell is easy"
