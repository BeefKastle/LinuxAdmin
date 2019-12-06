#!/bin/bash

# Script to check if there have been any changes to the files in the /etc/ directory
# if changes have been detected it alerts the user and then updates its reference


# target directory to be checked
targetdir=/etc/
# reference file, if none exsists its created and populated with the hash generated
reffile=/home/andrew/etc.ref

# generate a hash of the entire target directory and only output the digest to the sum variable
sum=`tar -cf - $targetdir | md5sum | awk '{print $1}'`

#echo $sum

# check if reference file exsists
if [ -f $reffile ] ; then
	# since it exsists check its contents to the sum
	# if they are the same state no changes
	if [ "$sum" == "$(head -n 1 $reffile)" ] ; then
		echo "No changes"
	else
	# if there were changes say so and update the reference
		echo "There were changes made!"
		echo "Updating the reference."
		echo $sum > $reffile
	fi
else
	# since the reference doesnt exsist create it and add the inital digest
	echo referecne does not exsist, Creating and populating.
	echo $sum > $reffile
fi
