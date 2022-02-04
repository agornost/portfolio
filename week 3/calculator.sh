# !/bin/bash
clear
NC='\033[0m'
# Take user Input
echo "Enter Two numbers : "
read a
read b

# Input type of operation
echo "Enter Choice :"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
read ch

# Switch Case to perform
# calculator operations
case $ch in
1)res=`echo $a + $b | bc` ; col=$'\e[1;34m'
;;
2)res=`echo $a - $b | bc` ; col=$'\e[1;32m'
;;
3)res=`echo $a \* $b | bc` ; col=$'\e[1;31m'
;;
4)res=`echo "scale=2; $a / $b" | bc` ; col=$'\e[1;35m'
;;
esac
#echo "Result : $res"
printf "Result: ${col}$res${NC}"
echo
