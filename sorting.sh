#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 21st September 2022
Description: Sort a given number in ascending or descending order
Sample Input: ./sorting.sh -a 5 4 6 2 3 8 9 7 1
Sample Output: Ascending order of array is 1 2 3 4 5 6 7 8 9
doc

array=($@)
lenArr=$((${#array[@]}-1))
arr=(${array[@]:1:$lenArr})

if [ $# -gt 0 ]
then
    if [ $1 = "-a" ]
    then
        for i in `seq 0 $(($lenArr-1))`
        do
            for j in `seq 0 $(($lenArr-2-$i))`
            do
                if [ ${arr[$j]} -gt ${arr[$j+1]} ]
                then
                    swap=${arr[$j]}
                    arr[$j]=${arr[$j+1]}
                    arr[$j+1]=$swap
                fi
            done
        done
        echo "Ascending order of array is ${arr[@]}"

    elif [ $1 = "-d" ]
    then
        for i in `seq 0 $(($lenArr-1))`
        do
            for j in `seq 0 $(($lenArr-2-$i))`
            do
                if [ ${arr[$j]} -lt ${arr[$j+1]} ]
                then
                    swap=${arr[$j]}
                    arr[$j]=${arr[$j+1]}
                    arr[$j+1]=$swap
                fi
            done
        done
        echo "Descending order of array is ${arr[@]}"
    else
        echo -e "Error : Please pass the choice.\nUsage : ./sorting -a/-d 4 23 5 6 3"
    fi
else
    echo -e "Error : Please pass the argument through command line.\nUsage : ./sorting -a/-d 4 23 5 6 3"
fi
