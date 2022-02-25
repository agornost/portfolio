#!/bin/bash
clear
read -s -p "Please enter password to acces main menu or type 'exit': " passwd
echo

#hashing of input password
hash=`echo -n $passwd | shasum -a 256`

#conditional check whether hash of input password matches the one in secret.txt
while [[ $passwd != 'exit' ]]; do
	if grep -q "$hash" "secret.txt"; then
		echo "Access Granted!"
		exit 0
	else
		echo "Access Denied!"
		exit 1
	fi
done
echo "Buy."
exit 1
