#!/bin/bash
now=$(date +%T.%N)
echo -e "\n"
echo "START: $now"
echo -e "\n"

#No need to make these variabiables static anymore.
base_oct=$1
oct4_start=$2
oct4_end=$3

#Find your blocks from the ip route.
for (( c=$oct4_start; c<=$oct4_end; c++ ))
        do (
                dig_ptr=$(dig -x $base_oct.$c +short)
                echo "$base_oct.$c PTR $dig_ptr"
        ) done

#Print STOP time.
now=$(date +%T.%N)
echo -e "\n"
echo "STOP: $now"
