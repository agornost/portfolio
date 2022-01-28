#!/bin/bash

read -p "Type folder name:" folder
mkdir ./$folder

read -s -p "Type secret password:" passwd
echo
echo -n $passwd | shasum -a 256 > ./$folder/secret.txt

