#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 26th September 2022
Description: Write script called say_hello, which will print greetings based on time
Sample Input: When we start shell (whenever you opening new tab or terminal)
Sample Output:  Good Morning user, Have nice day!
                This is Thursday 08 in June of 2017 (10:44:10 AM)
doc
#Assigning values to variables
hour=`date | cut -d " " -f4 | cut -d ":" -f1`
day=`date | cut -d " " -f1`
date=`date | cut -d " " -f3`
month=`date | cut -d " " -f2`
year=`date | cut -d " " -f6`
time=`date | cut -d " " -f4`

if [ $hour -gt 5 -a $hour -lt 12 ] #checking hour between 5 and 12
then
    echo -e "Good Morning user, Have nice day!\nThis is $day $date in $month of $year ($time)"
elif [ $hour -gt 12 -a $hour -lt 13 ] #checking hour is between 12PM and 1PM
then
    echo -e "Good noon, Have nice day!\nThis is $day $date in $month of $year ($time)"
elif [ $hour -gt 14 -a $hour -lt 17 ] #Checking hour is between 2PM and 5PM
then
    echo -e "Good afternoon user, Have nice day!\nThis is $day $date in $month of $year ($time)"
elif [ $hour -gt 17 -a $hour -lt 21 ] #Checking hour is between 5PM and 9PM
then
    echo -e "Good evening user, Have nice day!\nThis is $day $date in $month of $year ($time)"
else
    echo -e "Good night user, Have nice day!\nThis is $day $date in $month of $year ($time)"
fi
