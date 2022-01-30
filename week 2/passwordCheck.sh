#!/bin/bash

read -s -p "Type secret password:" passwd
echo
hash=`echo -n $passwd | shasum -a 256`
#echo $hash

if grep -q "$hash" "secret.txt"; then
	echo "Access Granted"
	exit 0
else
	echo "Access Denied"
	exit 1
fi
