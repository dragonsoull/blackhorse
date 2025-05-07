#!/usr/bin/env bash

awk 'BEGIN{FS=","; OFS="\t"} {print NR, $1, $2, $3}' nameemailavg.csv
echo "--------------------------------"
echo "--------------------------------"
awk -F "," '{print NR, $1 "\t" $2 "\t" $3}' nameemailavg.csv
