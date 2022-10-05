#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 21st September 2022
Description: Perform arithmetic operation on digits of a given number.
Sample Input: ./operator_dependent.sh 1234+
Sample Output: Sum of digits = 10
doc

var=$1
len=${#var}
op=${var: -1}
res=${var:0:1}
if [ $# -gt 0 ]
then
    case $op in
        +)
            for i in `seq 1 $(($len-2))`
            do
                res=`echo "$res + ${var:$i:1}" | bc`
            done
            echo "Sum of digits = $res"
            ;;
        -)
            for i in `seq 1 $(( $len - 2 ))`
            do
                res=`echo "$res - ${var:$i:1}" | bc`
            done
            echo "Subtraction of digits = $res"
            ;;
        x)
            for i in `seq 1 $(( $len - 2 ))`
            do
                 res=`echo "$res * ${var:$i:1}" | bc`
             done
             echo "Multiplication of digits = $res"
             ;;
         /)
             for i in `seq 1 $(( $len - 2 ))`
             do
                 res=`echo "scale=2;$res / ${var:$i:1}" | bc`
             done
             echo "Division of digits = $res"
             ;;
         *)
             echo "Error: Operator missing or invalid operator, please pass operator as last digit (+,-,x,/)"
             ;;
     esac
 else
     echo -e "Error : Please pass the arguments through CL.\nUsage :./operator_dependent.sh 2345+"
fi
