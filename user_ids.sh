#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 26th September 2022
Description: Count the number of users with user IDs between given range
Sample Input: ./user_ids.sh
Sample Output: Total count of user ID between 500 to 10000 is: 2
doc

data=(`cat /etc/passwd | cut -d ":" -f3`) #save user id in data array
count=0 #Initialising counter
if [ $# -ne 0 ] #checking for arguments
then
    if [ $# -eq 2 ] #checking argument is 2
    then
        if [ $2 -gt $1 ] #Checking argument 2 is greater than argument 1
        then
            for i in ${data[@]} #Iterating data array
            do
                if [ $i -gt $1 -a $i -lt $2 ] #Cheking whether user ID is between the given range
                then
                    count=$(($count+1)) #Incrementing counter variable
                fi
            done
            echo "Total count of user ID between $1 to $2 is : $count"
        else
            echo "Error : Invalid range. Please enter the valid range through CL."
        fi
    else
        echo -e "Error : Please pass 2 arguments through CL.\nUsage : ./user_ids.sh 100 200"
    fi
else
    for i in ${data[@]} #Iterating data array
    do
        if [ $i -gt 500 -a $i -lt 10000 ] #Checking whether user ID is between 500 and 10000
        then
            count=$(($count+1)) #Incrementing counter
        fi
    done
    echo "Total count of user ID between 500 to 10000 is: $count"
fi
