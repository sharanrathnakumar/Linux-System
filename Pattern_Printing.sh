#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 16th September 2022
Description: Read 'n' and generate a pattern given below( number increments from left to right
Sample Input: 
Sample Output:
doc

read -p "Enter the number: " rows #Read input from user
for i in `seq $rows`
do
    for j in `seq $i`
    do
        echo -n "$j "
    done
    echo
done
