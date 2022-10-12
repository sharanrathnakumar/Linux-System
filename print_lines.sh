#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 21st September 2022
Description: Script to print contents of file from given line number to next given number of lines.
Sample Input: ./print_lines.sh 5 3 myfile.txt
Sample Output:  line number 5
                line number 6
                line number 7
doc

arr=($@) #takes all arguments
len=${#arr[@]} #length of arguments
if [ $len -eq 3 ] #checking number of argument equal to 3
then
    if [ -f $3 ] #checking file exist or not
    then
        lineCount=`cat $3 | wc -l` #line count of file
        argCount=$(($1+$2)) #count of arguments
        if [ $(($argCount-1)) -le $lineCount ] #checking whether argument count less than line count
        then
            head -$(($argCount-1)) $3 | tail -$2 #print lines as per argument
        else
            echo "Error: data.txt is having only $lineCount lines. file should have atleast $(($argCount-1)) lines" #print error
        fi
    else
        echo "Error: not a File" #error message when not a file
    fi
else
    echo -e "Error: arguments missing!\nUsage: ./file_filter.sh start_line upto_line filename\nFor eg. ./file_filter.sh 5 5 <file>" #error when argument is missing
fi
