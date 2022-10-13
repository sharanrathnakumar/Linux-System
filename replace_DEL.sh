#!/bin/bash
<<doc
Name: Sharan Rathnakumar
Date: 28th September 2022
Description: Write a script to replace 20% lines in a C file randomly and replace it with the pattern
Sample Input:  ./replace_DEL.sh main.c
Sample Output: Randomly replace 20% lines from the file with given pattern / string. <-----------Deleted------------>
doc

if [ $# -eq 1 ] #check CLA passed or not
then
    if [ -f $1 ] #check file present or not
    then
        if [ -s $1 ] #check file has content
        then
            total=`wc -l $1 | cut -d " " -f1` #find the total lines in a file
            if [ $total -ge 5 ] #check total line number
            then
                line=$(($total/5)) #find 20% of the line
                for i in `seq $line` #iterating 20% of line times
                do
                    random=`shuf -i 1-$total -n1` #assigning random line number to a variable "random"
                    sed -i "$random s/.*/<---Deleted--->/" $1 #substituting words in random line to file
                done
                    cat $1 #displaying new file contents
            else
                echo "Error : file line less than 5" #printing error message
            fi
        else
            echo "Error : main2.c is empty file. So can’t replace the string." #error message
        fi
    else
        echo "Error : No such a file." #error message
    fi
else
    echo "Error : Please pass the file name through command line." #error message
fi
