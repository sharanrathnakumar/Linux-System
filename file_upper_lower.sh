#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 23rd September 2022
Description: Script to rename a file/directory replaced by lower/upper case letters
Sample Input: $ ./file_upper_lower.sh
Sample Output: Before running the script
$ ls
File.txt MyScript.SH MyFile007.txt dir/ Assign1/ newfolder/
$ ./file_upper_lower.sh
Files are rename in lowercase and directories are renamed in upper case
$ ls
file.txt myfile007.txt myscript.sh DIR/ ASSIGN1/ NEWFOLDER/

doc

for i in `ls` #Iterates all contents
do
    if [ -f $i ] #Checks whether content is file
    then
        new=`echo $i | tr A-Z a-z` #File name is converted to lower case
        mv $i $new #Filename is renamed
    else
        newd=`echo $i | tr a-z A-Z` #Directory name is converted to uppercase
        mv $i $newd #Directory is renamed
    fi
done
echo "Files are rename in lowercase and directories are renamed in upper case" #Output message
