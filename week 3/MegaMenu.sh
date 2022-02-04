#!/bin/bash
NC='\033[0m'
col_blue=$'\e[1;34m'
col_purple=$'\e[1;35m'

menu_item=0
../week\ 2/passwordCheck.sh

if test $? -eq 0 ; then
	while [[ menu_item -ne 8 ]]
	do
	echo "${col_blue}Select an option:"
	printf $NC
	echo "${col_purple}1. Create a folder
2. Copy a folder
3. Set a password
4. Calculator
5. Create Week Folders
6. Check Filenames
7. Download a File"
printf $NC
echo "8. Exit"

read menu_item
case $menu_item in

  "1")
    ../week\ 2/foldermaker.sh
    ;;

  "2")
    ../week\ 2/foldercopier.sh
    ;;

  "3")
    ../week\ 2/setPassword.sh
    ;;

	"4")
		./calculator.sh
		;;

	"5")
		./megafoldermaker.sh
		;;

	"6")
		./filenames.sh
		;;

	"7")
		./InternetDownloader.sh
		;;

	"8")
		exit
		;;
  *)
    echo "Please select option between 1 and 8"
    ;;
esac
done
else
	#echo "Access Denied"
	exit 1
fi
