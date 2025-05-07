#!/usr/bin/env bash
#

function generate_text() {
declare -a first_names=("John" "Jane" "Alex" "Emily" "Chris" "Stacy" "Michael" "Sarah" "David" "Laura")
declare -a last_names=("Smith" "Doe" "Johnson" "Brown" "Davis" "Garcia" "Martinez" "Wilson" "Anderson" "Taylor" "Thomas")
declare -a cities=("New York" "Los Angeles" "Chicago" "Houston" "Phoenix" "Philadelphia" "San Antonio" "San Diego" "Dallas" "San Jose")
declare -a countries=("USA" "Canada" "UK" "Australia" "Germany" "France" "Italy" "Spain" "Netherlands" "Sweden")

#echo first_names[$RANDOM % ${#first_names[@]}] >> textfile.txt
number_of_entries=${#first_names[@]}

echo "first_name last_name city country" >> $1
for ((i=0;i<number_of_entries;i++))
do 
    first_name=${first_names[$RANDOM % number_of_entries]}
    last_name=${last_names[$RANDOM % number_of_entries]}
    city=${cities[$RANDOM % ${#cities[@]}]}
    country=${countries[$RANDOM % ${#countries[@]}]}
    echo "$first_name  $last_name  $city  $country" >> $1
done

}

generate_text textfile1.txt
