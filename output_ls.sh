#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 22nd September 2022
Description: print contents of a directory without ls command
Sample Input: ./output_ls.sh
Sample Output: Assignments Classwork
doc

if [ $# -eq 0 ] #checks whether argument is entered or not
then
    echo * #prints all directories and files
else
    for i in $@ #iterates all the arguments
    do
        if [ -d $i ] #check whether argument is file or not
        then
            cd $i #change directory to argument
            pwd $i #print the present working directory
            echo * #prints all contents of the directory
        else
           echo "output_ls.sh: Cannot access ‘$1’ : No such a file or directory." #output error message
        fi
    done
fi
