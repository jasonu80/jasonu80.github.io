#!/bin/bash

# This is variables.
#echo "What's your name?"
#read name
#echo "Welcome! $name"

# Loops

#for i in {1..10};
#do
#echo $i
#done

# Conditionals

echo "Please put your name first!"
read name
if [ "$name" = "John" ]; then
	echo "Welcome John! This is your secret: abcd."
else
	echo "Sorry! You are not authorised to access the secret."
fi


