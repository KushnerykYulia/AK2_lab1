	#!/bin/bash
while true
do
	echo "Enter the directory you want to clean"
	read dname

	if [ ! -d "$dname" ]
	then
		echo "Directory doesn't exist"
		echo "Try another one? (y/n)"
		read answer
		case "$answer" in
			y|Y|yes|Yes|YES)
			continue
			;;
			n|N|NO|No|no)
			break
			;;
		esac
	fi
	echo "Deleting empty files"
	find "$dname" -type f -empty -delete

	echo "Deleting empty directories"
	find "$dname" -depth -type d -empty -delete

	echo "Removal complete"

	if [ -z "$(ls -A "$dname")" ]
	then
		echo "The directory is empty."
		echo "Do you want to delete it? (y/n)"
		read answer

		case "$answer" in
			y|Y|Yes|YES|yes) 
				rmdir "$dname"
				echo "Directory delete."
				;;
			*)
				echo "Directory wasn't deleted"
				;;
		esac
	fi
	echo "Do you want to clean another directory?"
	read answer 
	case "$answer" in 
		y|Y|yes|YES|Yes)
		;;
		n|N|no|No|NO)
		break
		;;
	esac
done


