#!/usr/bin/env bash
#
# Copyright (c) Rafael Rojero 04/07/2025
#
#

# We have already seen a few common bash commands.
# We will now take it a step further and write a full bash script using
# different bash features.
#

# Using variables

# Creates a variable called variable_name and assigns it the value "something"
variable_name="something"

############
# Write the command to print this variable

# $variable_name uses the dollar sign $ for variable expansion to get the value.
# echo prints the value: --> something
echo "$variable_name"

############
# Now print the following using the variable
# "Here is the value of the variable: something"

# Combines a string and a variable in one line prints "Here is the value of the variable: something"
echo "Here is the value of the variable: $variable_name"

###########
# Write the command to print the present working directory with the following
# string
# "I am currently in this directory: <name of the present working directory>"

# $(pwd) is command substitution. It runs the command inside and replaces it with the result.
# pwd prints the current working directory path.
echo "I am currently in this directory: $(pwd)"

##########

# Pointing to another variable using !
name="alice"
someone=name

# Now ${!someone} would reference to variable $name. Print something using the
# variable someone instead of name, to print "alice"

# ${!someone} is an indirect expansion which means it looks up the variable called someone,
# and it gives the name. Then gets the value of name which is alice.
echo "${!someone}"


# The use of special symbols to manipulate the variables is called shell
# expansion

# Functions

# printit() defines a function named printit
printit(){
    # Taking the first parameter passed, $1 = first argument to the function
    echo "my name is $1" 

    # Takes in all parameters, $* = all arguments passed to the function
    echo "Our names are $*" 
}

# Calls the function with two arguments
printit alice bob

# cond_test compares two strings given by user input
cond_test(){
    if [[ $1 == $2 ]]; then
        echo "hello"
    else
        echo "bye"
    fi
}

# Ask user for two strings to compare
echo "Enter first word:"
read word1

echo "Enter second word:"
read word2

cond_test "$word1" "$word2"

# Function to check sum
check_sum(){

    # number1 and number2 are set to numbers
    number1=3
    number2=4
    echo "What is the sum of $number1 and $number2?"

    # read user_input waits for user input
    read user_input

    # $((number1 + number2)) is calculating the sum of number1 and number2
    # -eq checks if numbers are equal
    if [[ $user_input -eq $((number1 + number2)) ]]; then
        echo "correct"
    else
        echo "incorrect"
    fi
}

############################
# Now use a while loop to keep checking sums with random numbers
while :
do
    # $RANDOM % 10 gives a number from 0 to 9 
    number1=$((RANDOM % 10))
    number2=$((RANDOM % 10))
    echo "What is the sum of $number1 and $number2?"
    read user_input
    if [[ $user_input -eq $((number1 + number2)) ]]; then
        echo "correct"
    else
        echo "incorrect"
    fi
done
