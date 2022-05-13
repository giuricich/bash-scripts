#!/bin/bash

read -p "How old are you? :" age
echo "you are $age years old"

if test $age -ge 65
then echo "haha you're old"
else
	echo "happy birthday"
fi
