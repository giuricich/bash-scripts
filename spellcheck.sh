#!/bin/bash
# output format stuff 
default="\e[0;39m"
error="\e[1;31m"
success="\e[0;32m"
bold="\e[1m"
regular="\e[0m"
echo -ne $default
echo "+---------------------------------------------+"
echo -n "|"
echo -ne $success
echo -ne "Green - Word Was Found"
echo -ne $default
echo -n " | "
echo -ne $error
echo -ne "Red - Word Not Found"
echo -ne $default
echo -ne "|\n"
echo "+---------------------------------------------+"
# counting variables
words=0
found=0
for string in $1; do
	((words++))	
	if grep -iq ^$string\$ /usr/share/dict/words ; then
		echo -ne "$success"
		echo -ne "$string "
		((found++))
	else
		echo -ne "$error"
		echo -ne "$string "
	fi
done
# tells the user how many words were matched
echo -e $default
echo -e "found $bold$found$regular out of $bold$words$regular words"
