#!/bin/bash
# note for course facilitator: password is qwerty
NC='\033[0m'
col_red=$'\e[1;31m'
col_green=$'\e[1;32m'
read -s -p "${col_red}Type secret password:" passwd
printf $NC
echo
hash=`echo -n $passwd | shasum -a 256`
if grep -q "$hash" "secret.txt"; then
	echo "${col_green}Access Granted"
	printf $NC
	exit 0
else
	echo "Access Denied"
	exit 1
fi
