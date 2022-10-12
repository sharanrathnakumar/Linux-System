#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 22nd September 2022
Description: recursive function to print each argument passed to the function
Sample Input: ./recursion.sh How are you? I am fine
Sample Output:  How
                are
                you?
                I
                am
                fine
doc


function rec #Function Initialisation
{
echo $1 #prints first argument
arr=($@) #save the arguments to array
if [ ${#arr[@]} -gt 1 ] #check whether array is empty or not
then
    arr=(${arr[@]:1}) #using offset to remove first argument
    rec ${arr[@]} #recursive calling
else
    return
fi
}

if [ $# -gt 0 ] #check whether argument is entered or not
then
    rec $@ #calling function
else
   echo "Error : Pass the arguments through command line." #output error message
fi
