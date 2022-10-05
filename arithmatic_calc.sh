#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 21st September 2022
Description: script for arithmetic calculator using command line arguments
Sample Input: ./A3.sh 25 + 41
Sample Output: 25 + 41 = 66
doc

if [ $# -gt 0 ] #check whether argument is entered
then
    if [ $# -eq 3 ] #check whether 3 arguments are there
    then
        echo -n "$1 $2 $3 = "
        case ${2} in
            +)
                echo "$1 $2 $3" | bc #performs addition
                ;;
            -)
                echo "$1 $2 $3" | bc #performs substraction
                ;;
            x)
                echo "$1 * $3" | bc #performs multipilcation
                ;;
            /)

                echo "scale=2; $1 $2 $3" | bc #performs division
                ;;
            *)
                echo "Error" #displays error
                ;;
        esac
    else
        echo -e "Error:Please pass 3 arguments.\nUsage:./arithmatic_calc.sh 2.3 + 6.7" #Error if 3 arguments are not there
    fi
else
    echo -e "Error : Please pass the arguments through command line.\nUsage:./arithmatic_calc.sh 2.3 + 6.7 " #Error if no argument is there
fi
