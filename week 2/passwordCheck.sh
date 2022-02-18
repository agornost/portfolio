#!/bin/bash
# note for course facilitator: password is qwerty

NC='\033[0m' 						#set default terminal font colour
col_red=$'\e[1;31m'			#set red terminal font colour
col_green=$'\e[1;32m'		#set green terminal font colour
read -s -p "${col_red}Type secret password:" passwd
printf $NC
echo

#hashing of input password
hash=`echo -n $passwd | shasum -a 256`

#conditional check whether hash of input password matches the one in secret.txt
if grep -q "$hash" "secret.txt"; then
	echo "${col_green}Access Granted"
	printf $NC
	exit 0
else
	echo "Access Denied"
	exit 1
fi
