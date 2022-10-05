#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 26th September 2022
Description: Script to delete empty lines from a file
Sample Input:  ./delete_empty_lines.sh file.txt
Sample Output:  Empty lines are deleted
                Hello
                How
                are
                you?

doc

if [ $# -eq 1 ] #Validation of command line argument
then
    sed -i '/^[[:blank:]]*$/d' $1 #Delete empty lines
    echo "Empty lines are deleted"
    cat $1
else
    echo "Error: Please pass the file name through command line."
fi
