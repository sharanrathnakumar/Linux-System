#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 16th September
Description: Read 'n' and generate a pattern given below( number increments from left to right)
Sample Input: 5
Sample Output:
doc

counter=1 #initialising counter variable

read -p "Enter no of rows: " rows #reads the value from user
for i in `seq $rows`
do
    for j in `seq $i`
    do
        echo -n "$counter "
        counter=$(($counter+1))
    done
    echo
done
