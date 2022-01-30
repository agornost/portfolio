#!/bin/bash

./passwordCheck.sh

if test $? -eq 0 ; then
	echo "1. Create a folder
2. Copy a folder
3. Set a password"
read menu_item
case $menu_item in

  "1")
    ./foldermaker.sh
    ;;

  "2")
    ./foldercopier.sh
    ;;

  "3")
    ./setPassword.sh
    ;;

  *)
    echo "Please select option 1, 2 or 3"
    ;;
esac
else
	#echo "Access Denied"
	exit 1
fi
