#!/usr/bin/env bash

#This script generates Cisco config files for Cisco devices according to provided csv file input.
#It uses the csv file to create a series of config files for different Cisco devices.

#passing .csv file name as 1st argument, hostname as 2nd argument, network as 3rd argument. 

declare hostname=""
declare ip_domain="winit.com.cn"
declare username="admin"
declare secret=""
declare tacacs=""
declare vtp_domain=""
declare vtp_password=""
declare vtp_version=""
declare input_network=""

declare -a network=()
declare -a csv_lines=()
declare -i default_reserved=50  #default number of reserved IP addresses
declare -A net=(
    ["vlan"]=""
    ["host"]=""
    ["subnet"]=""
)

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

readfile(){
    # Split the hostname into an array using dot as a delimiter
    IFS='.' read -r -a network <<< "$input_network"

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

    echo "Network: ${network[@]}"
    #echo "---------------------"
    #echo number of rows: $(wc -l < "$1")
    #echo "---------------------"
 
    line_number=0
    while read -r line; do
        # Skip empty lines
        if [[ -z "$line" ]]; then
            continue
        fi

        # Split the line into an array using comma as a delimiter
        IFS=',' read -r -a array <<< "$line"

        net["vlan"]="${array[0]}"
        net["host"]="${network[0]}.$((${network[1]}+$line_number)).${network[2]}.${network[3]}"

        if [[ ${array[1]} -gt 400 ]];    #If number of hosts is greater than 400
        then
            net["subnet"]="255.255.252.0"  
        elseif
        [[ ${array[1]} -gt 200 ]];
        then
            net["subnet"]="255.255.254.0"   #If number of hosts is greater than 200
        else
            net["subnet"]="255.255.255.0"   #If number of hosts is less than or equal to 200
        fi
        echo net["vlan"]: ${net["vlan"]}
        echo net["host"]: ${net["host"]}
        echo net["subnet"]: ${net["subnet"]}
        echo "---------------------"
        ((line_number++))

    done < <(sed '1d' "$1") # remove the first line of the csv file
}
readfile "$1"
