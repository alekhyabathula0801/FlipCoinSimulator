#!/bin/bash -x
#constants
HEAD=1
if [ $((RANDOM%2)) -eq $HEAD ]
then
	echo Heads
else
	echo Tails
fi
