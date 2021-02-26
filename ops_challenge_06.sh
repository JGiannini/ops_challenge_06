#!/bin/bash

# Script Name: Ops Challenge Show Listening Ports
# Class Name: Ops 201
# Author Name: Jamie Giannini
# Date of last revision: 2/25/2021
# Description of purpose: Create a script that can scan a target for open ports. 

# Objectives:
# [X] Create a bash function that prints all currently listening, well-known ports of the targeted computer.
# [] Call the function in your script after accepting IP address of the target PC from the user.
# [] Configure your script to accept user input and return only ports with status equal to user input. For example, user may type “CLOSED” and your script will return only ports that are closed status. If the user types “ALL” the script should return all ports. 

function get_ip () {
    echo "Enter a target IP address:"
    read -r target_ip
    echo "Enter a status of OPEN or CLOSED to filter results:"
    read -r status
        if [ "$status" == 'OPEN' ] || [ "$status" == 'open' ] || [ "$status" == 'o' ]
        then
        status="succeeded"
        else
        status="failed"
        fi
    target_ip_address "$target_ip" "$status"
}

function list_open_ports () {
    command ss -lntup #socket statistics shows all listening ports, numeric values, tcp, udp protocols and prints to screen
}

function target_ip_address () {
    command nc -z -v "$1" 1-1023 2>&1 | grep "$2" #net cat command scans open ports without sending data, -v provides more verbose information, passing it target ip to search through common ip range, filtering results by user status and passing output to the screen
}

list_open_ports #calling initial function to list out all currently listening ports
get_ip #then calling function to get the user's ip address and status inputs and passing those from within the function to the target_ip_address function





