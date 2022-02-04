#!/bin/bash
clear
IFS=$'\n'
while read i; do
  if [ -f $i ];
  then
  echo "$i - That file exists"

  elif [ -d $i ];
  then
  echo "$i - That’s a directory"

  else
  echo "$i - I don’t know what that is!"
  fi
#statements
done <filenames.txt
