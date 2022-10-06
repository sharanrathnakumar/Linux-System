#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date: 28th September 2022
Description: Script to print system information using commands
Sample Input: ./system_info.sh
Sample Output:
                1. Currently logged users
                2. Your shell directory
                3. Home directory
                4. OS name & version
                5. Current working directory
                6. Number of users logged in
                7. Show all available shells in your system
                8. Hard disk information

                9. CPU information.
                10. Memory Informations
                11. File system information.
                12. Currently running process.
                Enter the choice : 2
                Your shell directory is /bin/bash
                Do you want to continue (y/n) ? y
doc
opt="y" #declaring opt variable as "y"

while [ $opt = y ] #while opt is "y" execute the loop
do
    echo -e "1. Currently logged users\n2. Your shell directory\n3. Home directory\n4. OS name & version\n5. Current working directory\n6. Number of users logged in\n7. Show all available shells in your system\n8. Hard disk information\n9. CPU information.\n10. Memory Informations\n11. File system information.\n12. Currently running process."
    read -p "Enter choice: " choice
    case $choice in
        1)
            whoami #command to print user logged in
            ;;
        2)
            echo $SHELL #command to print shell directory
            ;;
        3)
            echo $HOME #print home directory
            ;;
        4)
            uname -v #print os name and version
            ;;
        5)
            pwd #print current working directory
            ;;
        6)
            who -q #print no of users logged in
            ;;
        7)
            cat /etc/shells #shows all available shells
            ;;
        8)
            hwinfo #shows hardware information
            ;;
        9)
            cat /proc/cpuinfo #shows CPU informations
            ;;
        10)
            cat /proc/meminfo #shows memory informations
            ;;
        11)
            df #shows memory informations
            ;;
        12)
            ps #shows current running process
            ;;
        *)
            echo "Error : Invalid option, please enter valid option" #default error message
            ;;
    esac
    read -p "Do you want to continue(y/n) ?" opt #read value to opt
done
