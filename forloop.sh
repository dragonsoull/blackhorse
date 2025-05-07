#!/usr/bin/env bash
#
for ((i=0;i<=10;i++))
do
	echo $i
done



declare -a fruits=("apple" "banana" "cherry")
for i in ${fruits[@]}
do
	echo "fruit[$i]: ${fruits[$i]}"
done
size=${#fruits[@]}

for ((i=0;i<size;i++))
do
	echo fruit[$i]: ${fruits[$i]}
done


for i in *
do 
	echo $i
done

echo "---------------------"
echo "---------------------"

declare -A hardwares=(
	["cpu"]="Intel"
	["gpu"]="NVIDIA"
	["ram"]="16GB"
)
hardwares["harddisk"]="SSD"
hardwares["motherboard"]="ASUS"
for i in ${!hardwares[@]}
do
	echo "hardware[$i]: ${hardwares[$i]}"
done

