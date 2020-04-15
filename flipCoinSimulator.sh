#!/bin/bash -x
#constant
HEAD=1
#variable
max=0
declare -A frequency
declare -A percentage
read -p "enter number of coins " numOfCoins
read -p "enter number of flips " numOfFlips
function findCombination(){
        for (( coin=0; coin<$numOfCoins; coin++ ))
        do
                randomNum=$((RANDOM%2))
                if [ $randomNum -eq $HEAD ]
                then
                        toss=H
                else
                        toss=T
                fi
                combination="$combination$toss"
        done
	echo $combination
}
#compute the frequency of combinations
for (( flip=0; flip<$numOfFlips; flip++ ))
do
	#calling function to find combination
        combinations="$( findCombination )"
	frequency[$combinations]=$((${frequency[$combinations]}+1))
done
#compute percentage of combinations and find winning combination
for key in "${!frequency[@]}"
do
        percentage[$key]=$((${frequency[$key]}*100/$numOfFlips))
        if [ ${percentage[$key]} -gt $max ]
        then
                max=${percentage[$key]}
		winningCombination=$key
        fi
done
#sort combinations in ascending order by value
for k in "${!percentage[@]}"
do
        echo $k ' - ' ${percentage["$k"]}
done | sort -n -k3
echo winning combinations is $winningCombination with percentage of $max
