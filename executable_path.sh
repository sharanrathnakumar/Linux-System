#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 27th September 2022
Description: For each directory in the $PATH, display the number of executable files in that directory
Sample Input:
Sample Output:
doc
total=0 #Initialising total as 0
path=(`echo $PATH | tr ":" " "`) #Path variable transformed colon to space and stored into path array
for i in ${path[@]} #Iterating path array
do
    count=0 #Initialising count as 0

    if [ -d $i ] #Checking whether path is directory or not
    then
        cd $i #Change directory
        for j in `ls` #Iterating over all lists
        do
            if [ -x $j ] #cheking for executable files
            then
                count=$(($count+1)) #Incrementing counter
            fi
        done
        echo "Current dir:$i"
        echo "Current count:$count"
        total=$(($total+$count))
    fi
done
echo "Total - $total"
