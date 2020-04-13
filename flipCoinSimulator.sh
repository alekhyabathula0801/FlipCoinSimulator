#!/bin/bash -x
#constants
HEAD=1
HEAD_HEAD=1
HEAD_TAIL=2
TAIL_HEAD=3
H_H_H=1
H_H_T=2
H_T_H=3
H_T_T=4
T_H_H=5
T_T_H=6
T_H_T=7
declare -A dict
declare -A percent
dict=( [H]=0 [T]=0 [HH]=0 [HT]=0 [TH]=0 [TT]=0 [HHH]=0 [HHT]=0 [HTH]=0 [HTT]=0 [THH]=0 [TTH]=0 [THT]=0 [TTT]=0 )
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
	case $((RANDOM%8)) in
                $H_H_H)
                        ((dict[HHH]++))
		;;
                $H_H_T)
                        ((dict[HHT]++))
                ;;
                $H_T_H)
                        ((dict[HTH]++))
                ;;
                $H_T_T)
                        ((dict[HTT]++))
                ;;
                $T_T_H)
                        ((dict[TTH]++))
                ;;
                $T_H_T)
                        ((dict[THT]++))
                ;;
                $T_H_H)
                        ((dict[THH]++))
                ;;
                *)
                        ((dict[TTT]++))
                ;;
	esac
done
for key in "${!dict[@]}"
do
	percent[$key]=$((${dict[$key]}*100/$n))
done
echo number of ${!dict[@]} are ${dict[@]}
echo percentage of ${!percent[@]} are ${percent[@]} respectively
