#!/bin/bash
#clear screen

./passwordCheck.sh

if test $? -eq 0 ; then
menu_item=0
while [[ menu_item -ne 4 ]]
do
echo "Select an option:
1. Data Harvesting
2. General Statistics
3. Individual Statistics
4. Exit"
read menu_item
case $menu_item in
  "1")
		./password_crawler.sh
		;;

	"2")
		./general_stats.py
		;;

	"3")
		./single_password.py
		;;

	"4")
		exit
		;;
	*)
		echo "Please select option between 1 and 4"
		;;
  esac
  done
else
	exit 1
fi
