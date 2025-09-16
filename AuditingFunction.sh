#!/bin/bash

# Function for auditing registered users and their last login.
# Function is called in SystemAdmin.sh-file.
auditing(){
    # Make an array of users:
    userArray=($(cat /etc/passwd | grep '/home' | cut -d: -f1))
    
    # Loop through the array to create an appropriate output:
    for user in "${userArray[@]}"; do
        echo "User $user: "

        # Loop through the groups user is in:
        # Cutting out everyting except the group name.
        groupArray=($(grep $user /etc/group | cut -d: -f1))
        # Looping through groups to display output:
        for group in "${groupArray[@]}"; do
            if [ "$group" == "$user" ]; then
                # Different output for primary group for readability:
                echo "Member in: $group (primary group)"
            else
                echo "Member in: $group"
            fi
        done

        # Command to display login/-outs for the user:
        last -R | grep $user | awk '{print "Logged in from: ", $2, "|", "Date: ", $3, $4, $5, "|", "Login/logout time: ", $6, $7, $8, $9}' | column -ts '|'

    # To separate the outputs between users more clearly:
    echo "---"

    done
}