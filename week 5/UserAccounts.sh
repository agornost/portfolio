#!/bin/bash
clear
#omit lines from /etc/passwd starting with "#" and grep only ones contain '/bin/bash' pattern
cat /etc/passwd | grep -v '#' | grep '/bin/bash' > info.txt

#Use ":" as a delimeter
awk 'BEGIN {
    FS=":";
    print "| \033[34mServer Type              \033[0m | \033[34mUserID \033[0m | \033[34mGroupID\033[0m | \033[34mHome                         \033[0m | \033[34mShell           \033[0m | ";
    print "|___________________________|_________|_________|_______________________________|__________________|"
}
{
    printf("| \033[33m%-25s\033[0m | \033[35m%-7s\033[0m | \033[35m%-7s\033[0m | \033[35m%-29s\033[0m | \033[35m%-16s\033[0m |\n", $1, $3, $4, $6, $7);
}
END {
    print "|___________________________|_________|_________|_______________________________|__________________|";
}' info.txt
