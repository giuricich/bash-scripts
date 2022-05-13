#!/bin/bash
# This script inputs and validates a phone number from the bash shell
# fun stuff 
default="\e[0;39m"
error="\e[1;31m"
success="\e[1;32m"
# serious stuff 
loop=true
while $loop
do
	# -n - newline supression | -e enable escape sequences
	echo -ne "$default" 
	echo -ne "Please enter you phone number in the form XXX-XXX-XXXX\n: " 
	read number
	if [[ "$number" =~ ^[0-9]{3}-[0-9]{3}-[0-9]{4}$ ]] ; then
		loop=false
		echo -ne "$success" 
		echo "Thank you for your co-operation"
	
	else
		echo -ne "$error" 
		echo -e "That dosen't look right... Try again.\n"
	fi	
done
exit
