#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 26th September 2022
Description: Script to determine whether a given file system or mount point is mounted
Sample Input:  ./mounted_fs.sh /dev/sda2
Sample Output:  File-system /dev/sda2 is mounted on / and it is having 98%
                used space with 3298220 KB free.
doc

#Storing the field values in arrays

fileSys=(`df | tr -s " " | cut -d " " -f1`)
Available=(`df | tr -s " " | cut -d " " -f4`)
Used=(`df | tr -s " " | cut -d " " -f5`)
Mount=(`df | tr -s " " | cut -d " " -f6`)
len=${#fileSys[@]} #length of fileSys array
flag=0

if [ $# -eq 1 ] #validation of argument
then
    for i in `seq 0 $(($len-1))` #Iteration of array
    do
        if [ $1 = ${fileSys[$i]} ] #checking for mount
        then
            echo -e "${fileSys[$i]} is mounted on ${Mount[$i]} and it is having ${Used[$i]}\nused space with ${Available[$i]} KB free."
            flag=1  #setting flag as 1 after printing
        fi
    done
    if [ $flag -eq 0 ] #checks whether flag is 0
    then
        echo "$1 is not mounted."
    fi
else
    echo "Error : Please pass the name of the file-system through command line."
fi
