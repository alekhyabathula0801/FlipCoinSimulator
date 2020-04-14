#!/bin/bash -x
#constant
HEAD=1
#variable
max=0
declare -A frequency
declare -A percentage
read -p "enter number of coins" numOfCoins
read -p "enter number of flips" numOfFlips
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
for (( flip=0; flip<$numOfFlips; flip++ ))
do
        combinations="$( findCombination )"
        frequency[$combinations]=$((${frequency[$combinations]}+1))
done
for key in "${!frequency[@]}"
do
        percentage[$key]=$((${frequency[$key]}*100/$numOfFlips))
        if [ ${percentage[$key]} -gt $max ]
        then
                max=${percentage[$key]}
                winningCombination=$key
        fi
done
for k in "${!percentage[@]}"
do
        echo $k ' - ' ${percentage["$k"]}
done | sort -n -k3
echo winning combination is $winningCombination with percentage of $max
