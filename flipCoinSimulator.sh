#!/bin/bash -x
#constants
HEAD=1
HEAD_HEAD=1
HEAD_TAIL=2
TAIL_HEAD=3
declare -A dict
declare -A percent
dict[H]=0
dict[T]=0
dict[HH]=0
dict[HT]=0
dict[TH]=0
dict[TT]=0
read -p "enter number of flips" n
for (( flip=1; flip<=$n; flip++ ))
do
	if [ $((RANDOM%2)) -eq $HEAD ]
	then
		((dict[H]++))
	else
		((dict[T]++))
	fi
	case $((RANDOM%4)) in
		$HEAD_HEAD)
			((dict[HH]++))
		;;
                $HEAD_TAIL)
                        ((dict[HT]++))
                ;;
                $TAIL_HEAD)
                        ((dict[TH]++))
                ;;
                *)
                        ((dict[TT]++))
                ;;
	esac
done
for key in "${!dict[@]}"
do
	percent[$key]=$((${dict[$key]}*100/$n))
done
echo number of ${!dict[@]} are ${dict[@]}
echo percentage of ${!percent[@]} are ${percent[@]} respectively
