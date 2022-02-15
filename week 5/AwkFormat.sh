#!/bin/bash
echo "Google Server IPs:"
# awk '{print $1}' input.txt
awk 'BEGIN {
    FS=":";
    print "________________________________";
    print "| \033[34mServer Type\033[0m | \033[34mIP             \033[0m |";
}
{
    printf("| \033[33m%-11s\033[0m | \033[35m%-15s\033[0m |\n", $1, $2);
}
END {
    print("________________________________");
}' input.txt
