#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 26th September 2022
Description: Display the longest and shortest user-names on the system
Sample Input: ./largest_username.sh
Sample Output:  The Longest Name is: speech-dispatcher
                The Shortest Name is:lp
doc

username=(`cat /etc/passwd | cut -d ":" -f1`) #storing values to username
largest=${username[0]} #storing first element on variable
smallest=${username[0]} #storing first element on variable
len=$((${#username[@]}-1)) #One less than length of array

for i in `seq $len` #Iterating array element
do
    if [ ${#username[$i]} -gt ${#largest} ] #checking first element lenght is less than
    then
        largest=${username[$i]} #storing largest element in largest variable
    fi
    if [ ${#username[$i]} -lt ${#smallest} ] #checking first element length is greater than
    then
        smallest=${username[$i]} #storing smallest element in smallest variable
    fi
done
echo "The Longest Name is: $largest" #Printing output
echo "The Shortest Name is:$smallest" #Printing output
