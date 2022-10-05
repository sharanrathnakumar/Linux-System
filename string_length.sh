#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 21st September 2022
Description: Script to print the length of each and every string using arrays
Sample Input: ./string_length.sh hello hai how are you?
Sample Output:  Length of string (hello) - 5
                Length of string (hai) - 3
                Length of string (how) - 3
                Length of string (are) - 3
                Length of string (you?) - 4

doc

arr=($@) #Takes all the argument from CLI
len=${#arr[@]} #Find the length of argument
if [ $len -gt 0 ] #Check whether user entered argument
then
        for index in `seq 0  $(($len-1))` #Iterates length of array times
        do
            val=${#arr[$index]}  #Finds length of string
            echo "Length of string ( ${arr[$index]} ) - $val" #prints the message with length of string
        done
else
    echo "Error : Please pass the arguments through command-line." #prints error message if no argument is entered
fi
