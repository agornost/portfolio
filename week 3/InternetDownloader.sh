#!/bin/bash
wget=/usr/local/bin/wget
url=null
clear
  while [[ $url != exit ]]
  do
    read -p "Please type the URL of a file to download or type 'exit' to quit: " url
    if [ $url = 'exit' ]
      then
        echo "Goodbye!"
      exit
    fi
    read -p "Type the location of where would you like to download the file to: " locdir
    $wget -P "${locdir}" "${url}"
  done
