#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 23rd September 2022
Description: Script to convert string lower to upper and upper to lower
Sample Input:  ./upper_lower.sh file.txt
Sample Output:  1 – Lower to upper
                2 – Upper to lower
                Please select option : 1
                WHAT IS OS?
                WHAT ARE THE DIFFERENT OS?
                WHEN IS OS USED?
                WHAT IS PARTITION AND ITS USE?
                HOW MANY PARTITIONS CAN BE DONE?
doc

if [ $# -gt 0 ] #validation of CLA
then
    if [ -f $1 ] #check whether it is a file
    then
        if [ -s $1 ] #checks whether file is not empty
        then
            echo -e "1-Lower to Upper\n2-Upper to Lower" #Printing usage details
            read -p "Please select option: " option #read the input to option
            if [ $option -eq 1 ] #checking option is 1
            then
                cat $1 | tr a-z A-Z #convert lower case to upper and displays
            elif [ $option -eq 2 ] #cheking whether option is 2
            then
                cat $1 | tr A-Z a-z #convert upper to lower case
            else
                echo "Invalid option" #error message
            fi
        else
            echo "Error: No contents inside the file." #error message
        fi
    else
        echo "Error: Not a file" #error message
    fi
else
    echo "Error : Please pass the file name through command line." #error message
fi
