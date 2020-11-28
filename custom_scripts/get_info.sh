#!/bin/bash

if file "$1" | grep -q directory 	
then #is a directory	
	cd "$1"
	pwd 
	cd ..
	du -sh "$1" #Print directory size
       	cd "$1"
	echo $(($(ls -lh | wc -l)-1)) "items in directory" #extra line in wc output
else #isn't a directory 
	ls -sh | grep "$1"
	file "$1"
fi

echo "Press enter to exit"
read

