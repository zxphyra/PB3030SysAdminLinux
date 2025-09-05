#!/bin/bash

# Function for auditing registered users and their last login.
# Function is called in SystemAdmin.sh-file.
auditing(){
    echo "Type your desired operation into the terminal: "

    echo "1: List last log ins."
    echo "2: List users with username, UID, and group."

    read auditingChoice

    case $auditingChoice in
        1)
            echo "You have chosen to see a list of log ins: "

            echo "Viewing users by: "
            echo "| name | session |   hostname       |   date and time   |     logout      |"

            last | grep -v "reboot"
            ;;
        2)
            echo "You have chosen to list users."
            cat /etc/passwd | awk -F: 'print "User: " $1 ", UID: " 
            ;;
        *)
            echo "Invalid choice."
            ;;
        esac
}
