#!/usr/bin/env bash

echo "Hello Black Horse!"

i=0
while ((i < 5)); do
  ((i++))
  echo "Hello Black Horse! $i"
done
echo "End of while loop Black Horse!"

[[ -d /home/ma ]] && echo "Directory exists" || echo "Directory does not exist"



declare -a fruits=("apple" "banana" "cherry")
for fruit in "${fruits[@]}"; do
  echo "Fruit: $fruit"
done

echo ${fruits[0]}
echo ${fruits[1]}

fruit[5]="orange"
echo ${fruit[5]}

echo ${fruits[4]}
fruits+=("grape")

for fruit in ${fruits[@]}; do
  echo "Fruit: $fruit"
done
echo 

fruits+=("kiwi" "watermelon")
for fruit in "${fruits[@]}"; do
  echo "Fruit: $fruit"
done

for i in {0..8}; do
  echo fruit[$i]: ${fruits[$i]}
done
