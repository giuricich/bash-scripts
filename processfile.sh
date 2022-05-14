#!/bin/bash
default="\e[0;39m"
error="\e[1;31m"
success="\e[1;32m"

file_error="Error, File does not exist"
dir_error="Error, Directory does not exist"

echo "1. Delete a Regular File"
echo "2. Copy a Directory File"
echo "3. Change the (octal) permissions of a File"
echo "4. Rename a File"
echo "5. List a Directory Recursively"
echo "6. Quit"

read selection
case $selection in
1)
	read -p "Delete which file?: " file
	if [ -r $file ] ; then
		rm $file
		echo -ne $success
		echo "$file has been successfully deleted"
	else
		echo -ne $error
		echo $file_error
	fi
	;;
2)
	read -p "Copy which directory?: " directory
	if [ -d $directory ] ; then
		cp -r $directory . 
		echo -ne $success
		echo "$directory has been successfully coppied"
	else
		echo -ne $error
		echo $dir_error 
	fi
	;;
3)
	read -p "Edit permissions for which file?: " file
	read -p "What should the new permissions be? XXX:" permissions
	if [ -f $file ] ; then
		chmod $permissions $file 
		echo -ne $success
		echo "$file's permissions have been changed"
	else
		echo -ne $error
		echo $file_error 
	fi
	;;
4)
	read -p "Rename which file?: " file
	read -p "What shoud its new name be?: " name
	if [ -f $file ] ; then
		mv $file $name
		echo -ne $success
		echo "$file has been renamed to $name"
	else 
		echo -ne $error
		echo $file_error
	fi
	;;
5)
	read -p "Which directory to recurse?: " directory
	if [ -d $directory ]; then
		ls -R $directory
	else
		echo -ne $error
		echo $dir_error
	fi
	;;
q|6)
	echo "Goodbye!"
	exit
	;;
*)
	echo "Invalid Entry, Please Try Again"
esac
# cleans up terminal output
echo -ne $default
