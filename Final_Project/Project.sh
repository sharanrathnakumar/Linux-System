#!/bin/bash

<<doc
Name: Sharan Rathnakumar
Date:
Description: Linux System Project
Sample Input:
Sample Output:
doc

clear
#Initialising Arrays
userName=(`cat username.csv`)
userPassword=(`cat password.csv`)
userCount=$((${#userName[@]}-1))

answerkey=(`cat origanswer.txt`)
qCount=${#answerkey[@]}

line=0
mark=0
notAnswered=0
wrongAnswer=0
#echo $userCount
#functions
function option(){

    echo -e -n "1)Take Test.\n2)Exit\nEnter your choice: "
    read opt
    case ${opt} in
        1)
            clear
            echo "Test Page"
            Test
            ;;
        2)
            echo "Exit Page"
            ;;
        *)
            echo "Invalid Entry"
            ;;
    esac
}

function valuation() {

#echo ${useranswer[@]}
		useranswer=(`cat useranswer.txt`)
		for i in `seq 0 $(($qCount-1))`
		do
#			echo "Answer key: ${answerkey[$i]} User Answer: ${useranswer[$i]}"
				if [ ${answerkey[$i]} = "${useranswer[$i]}" ]
				then
					line=$(($line+5))
					mark=$(($mark+1))
#					echo "Correct: ${useranswer[$i]} and ${answerkey[$i]}"
					display_result $line  correct
				elif [ ${useranswer[$i]} = "e" ]
				then
					line=$(($line+5))
					notAnswered=$(($notAnswered+1))
					display_result $line unattempted
#					echo "Unattempted: ${useranswer[$i]} and ${answerkey[$i]}"
				else
					line=$(($line+5))
					wrongAnswer=$(($wrongAnswer+1))
					display_result $line wrong
					#echo "Wrong: ${useranswer[$i]} and ${answerkey[$i]}"
				fi
			done

	echo -e "\n\n\033[1;30mFinal Score: $mark\nTotal Questions:$qCount\nUnattempted Questions:$notAnswered\nWrong Answers: $wrongAnswer \033[0m"
	sed -i '/^.*$/d' useranswer.txt
}

function display_result() {

	lines=$1
	status=$2

	head -$lines questionbank.txt | tail -5
	case $status in
		correct)
			echo -e "\e[0;32m Your Answer: ${useranswer[$i]} is correct\e[0m"
			;;
		unattempted)
			echo -e "\e[0;36m Your Answer: Not Attempted \e[0m"
			echo -e "\e[0;32m Correct Answer: ${answerkey[$i]} \e[0m"
			;;
		wrong)
			echo -e "\e[0;31m Your Answer: ${useranswer[$i]} is wrong \e[0m"
			echo -e "\e[0;32m Correct Answer: ${answerkey[$i]}\e[0m"
			;;
	esac

}

function Test() {
	lineCount=`cat questionbank.txt | wc -l`
    for i in `seq 5 5 $lineCount`
    do
        head -$i questionbank.txt | tail -5
        for timer in `seq 9 -1 1`
        do
		echo -e -n "\rChoose option ($timer): \c"
            read -t 1 opt
            if [ $opt ]
            then
               break
	    fi
      	done
	clear
	if [ -z $opt ]
	then
		opt="e"
		`echo $opt >> useranswer.txt`
	else
		`echo $opt >> useranswer.txt`
	fi
    done
#    cat useranswer.txt
    echo "Test Completed"
    valuation
}

function readPassword()
{
read -s password
echo $password
}

counter=0
function loginPass()
{
    var="`readPassword`"
    #echo $var
    if [ $var = ${userPassword[$index]} ]
    then
        clear
        echo "Login Succesfull"
        option
    else
        echo "Invalid Password"
        counter=$(($counter+1))
        if [ $counter -lt 3 ]
        then
            echo -e -n "$((3-$counter)) Attempt Left\nPassword: "
            loginPass
        else
            echo "2.Exit"
        fi
    fi
}

#sign-up password function
function signUpPass()
{
read -p "Username: " username
echo -n "Password: "
var=`readPassword`
if [ ${#var} -lt 8 ]
then
	clear
    echo "The password should be atleast 8 characters"
    signUpPass
else
    echo -e -n "\nConfirm Password: "
    var2=`readPassword`
fi

if [ "$var" = "$var2" ]
then
	clear
	echo "$username" >> username.csv
	echo "$var" >> password.csv
#    sed -i "$ a $username" username.csv #write username to csv file
#    sed -i "$ a $var" password.csv #write password to csv file
    echo "User Account Created"
    option
else
	clear
    echo "Password dont match:"
    signUpPass
fi
}

function login() {
if [ -s username.csv ]
then
echo -e "<------------------------Login / Sign Up ------------------------>\n\n"
#username validation
read -p "Enter Username: " username
for index in `seq 0 $userCount`
do
    if [ "$username" = "${userName[$index]}" ]
    then
        echo -n "Enter password to Login: "
        loginPass
        break
    else
        flag="0"
    fi
done
if [ "$flag" = 0 ]
then
	echo "New user create Password"
	signUpPass
fi
else
	clear
	echo -e "No user account existing. Sign Up first\n\n"
	main
fi
}

function main() {
	echo -e "<-------------Linux System Project--------------------->\n\n"
	echo -e "1) Login\n2) Sign-Up\n3) Exit\nEnter your Choice:"
	read option
	case $option in
		1) clear
			login
			;;
		2) clear
			signUpPass
			;;
		3) clear
			;;
		*) echo "Invalid Option"
			main
			;;
	esac
}
main
