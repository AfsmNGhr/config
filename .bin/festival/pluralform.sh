#!/usr/bin/env bash

n=$(($1 % 100))
n1=$(($n % 10))

if [ $n -gt 10 -a $n -lt 20 ]; then echo $4;
elif [ $n1 -gt 1 -a $n1 -lt 5 ]; then echo $3;
elif [ $n1 -eq 1 ]; then echo $2;
else echo $4
fi
