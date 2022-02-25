#!/bin/bash
if [ -f "output.csv" ]; then
  read -p "Output file exists. Do you want to overwrite it? (y/n): " answer
  if [ $answer == "y" ]; then
    echo "This will take a while, have a cuppa!"
    for i in {a..z}
      do
        curl -s  https://passwordsdatabase.com/view/$i |
          grep -r 'User ID: ' > u_temp.txt
          echo "Scraping data for vendors starting with" $i
        cat u_temp.txt | awk -F 'span>' '{print $2}' |
          sed 's/<\/p>//' |
          sed '{
              s/^$/(none)/
              s/n\/a/(none)/
              s/^none/(none)/
              s/(blank)/(none)/
              s/^blank/(none)/
              s/NULL/(none)/
                }' >> u_output.txt
        curl -s  https://passwordsdatabase.com/view/$i |
          grep -r 'Password: ' > p_temp.txt
        cat p_temp.txt | awk -F 'span>' '{print $2}' |
          sed 's/<\/p>\t*\ *//' |
          sed '{
              s/^\t/(none)/
              s/^$/(none)/
              s/n\/a/(none)/
              s/^none/(none)/
              s/(blank)/(none)/
              s/^blank/(none)/
              s/NULL/(none)/
              s/,/ /
                }' >> p_output.txt
        paste -d "," u_output.txt p_output.txt > output.csv
      done
      rm -rf *_temp.txt *_output.txt
  else
    exit 1
  fi
fi
