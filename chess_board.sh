#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 21st September 2022
Description: Script to print chess board
Sample Input: ./chess_board.sh
Sample Output: Prints pattern
doc

for i in `seq 8` #loops row 8 times
do
    for j in `seq 8` #loops coloums 8 times
    do
        val=`echo "$i+$j" | bc` #sum of row number and coloum number
        if [ $(($val%2)) -eq 0 ] #checks whether the sum is odd or even
        then
            echo -e -n "\e[47m" " " #for even value prints black
        else
            echo -e -n "\e[40m" " " #for odd value prints white
        fi
    done
    echo -e "\e[0m" " "
done
