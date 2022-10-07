#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 23rd September 2022
Description: Given album name and corresponding directory, this scripts renames the jpg files with new name passed through command line
Sample Input:  ./rename_album.sh day_out
Sample Output:  All .jpg files in current directory is renamed as
                day_out001.jpg day_out002.jpg day_out003.jpg day_out005.jpg day_out004.jpg
doc
if [ $# -eq 1 ] #validation
then
    for i in `echo *.jpg` #iterates all jpg files
    do
        num=`echo $i | tr -cd [:digit:]` #Saves the number name of jpg in num
        mv $i $1$num.jpg #renames the file
    done
else
    echo "Error : Please pass the prefix name through command line." #prints error message
fi
