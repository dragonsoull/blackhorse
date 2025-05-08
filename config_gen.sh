#!/usr/bin/env bash

#This script generates Cisco config files for Cisco devices according to provided csv file input.
#It uses the csv file to create a series of config files for different Cisco devices.

#passing .csv file name as 1st argument, hostname as 2nd argument, network as 3rd argument. 

declare hostname=""
declare -a network="" 
declare -i default_reserved=50  #default number of reserved IP addresses

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <filename> <hostname> <network>"
    exit 1
fi

readfile(){
    hostname=$2
    # Split the hostname into an array using dot as a delimiter
    IFS='.' read -r -a network <<< "$3"

    # for ((i=0; i<${#network[@]}; i++));
    # # for i in "${network[@]}";
    # do
    #     # Check if the item is empty
    #     if [[ -z "$network[i]}" ]]; then
    #         continue
    #     fi

    #     # Print the item
    #     echo "${network[i]}"
    # done
    # echo "---------------------"

    # Check if the file exists
    if [ ! -f "$1" ]; then
        echo "File not found!"
        exit 1
    fi
    # Check if the file is readable
    if [ ! -r "$1" ]; then
        echo "File is not readable!"
        exit 1
    fi
    # Check if the file is not empty
    if [ ! -s "$1" ]; then
        echo "File is empty!"
        exit 1
    fi
    # Check if the file is a CSV file
    if [[ "$1" != *.csv ]]; then
        echo "File is not a CSV file!"
        exit 1
    fi


    # # Check if the file has a valid number of columns
    # if [ "$(head -n 1 "$1" | grep -c ',')" -lt 3 ]; then
    #     echo "File does not have a valid number of columns!"
    #     exit 1
    # fi
    # # Check if the file has a valid number of columns
    # if [ "$(head -n 1 "$1" | grep -c ',')" -lt 2 ]; then
    #     echo "File does not have a valid number of columns!"
    #     exit 1
    # fi

    echo "Hostname: $hostname"
    echo "Network: ${network[@]}"
    echo "---------------------"
    echo number of rows: $(wc -l < "$1")
    echo "---------------------"
 

    while read -r line; do
        
        # Skip empty lines
        if [[ -z "$line" ]]; then
            continue
        fi

        # Split the line into an array using comma as a delimiter
        IFS=',' read -r -a array <<< "$line"

        for item in ${array[@]};   
        do
            # Check if the item is empty
            if [[ -z "$item" ]]; then
                continue
            fi
            # Print the item
            echo "$item"
        done
        echo "---------------------"
        # # Check if the first element is "hostname"
        # if [[ "${array[0]}" == "hostname" ]]; then
        #     # Create a new config file with the hostname as the filename
        #     filename="${array[1]}.cfg"
        #     echo "Creating config file: $filename"
        #     touch "$filename"
        # else
        #     # Write the rest of the line to the config file
        #     echo "$line" >> "$filename"
        # fi
    done < <(sed '1d' "$1") # remove the first line of the csv file
}
readfile "$1" $2 $3
