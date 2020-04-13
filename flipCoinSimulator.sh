#!/bin/bash -x
#constants
HEAD=1
declare -A dict
declare -A percent
dict[H]=0
dict[T]=0
read -p "enter number of flips" n
for (( flip=1; flip<=$n; flip++ ))
do
	if [ $((RANDOM%2)) -eq $HEAD ]
	then
		((dict[H]++))
	else
		((dict[T]++))
	fi
done
for key in "${!dict[@]}"
do
	percent[$key]=$((${dict[$key]}*100/$n))
done
echo percentage of heads and tails are ${percent[@]} respectively
