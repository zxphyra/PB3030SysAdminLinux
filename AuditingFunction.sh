#!/bin/bash

# Function for auditing registered users and their last login.
# Function is called in SystemAdmin.sh-file.
auditing(){
    # Make an array of users:
    userArray=($(cat /etc/passwd | awk -F: '($3 >= 1000 && $3 <= 2000){ print $1 }'))
    
    # Loop through the array to create an appropriate output:
    for user in "${userArray[@]}"; do
        echo "User $user: "

        # Print the users UID:
        userUid=$(cat /etc/passwd | grep $user | awk -F: '{ print $3 }')
        echo "UID: $userUid"

        # Make an array for the groups the user is in:
        groupArray=($(grep $user /etc/group | cut -d: -f1))

        # Loop through the groups the user is in:
        for group in "${groupArray[@]}"; do

            # Saving the GID in a variable:
            groupGid=$(getent group $group | cut -d: -f3)

            # If statement for dividing between groups and primary groups:
            if [ "$group" == "$user" ]; then
                # Different output for primary group for readability:
                echo "Primary group: $group (GID: $groupGid)"
            else
                echo "Member in: $group (GID: $groupGid)"
            fi
        done

        # Command to display login/-outs for the user:
        # Too long command but logs are binary.
        last -R | grep $user | awk '{print "Logged in from: ", $2, "|", "Date: ", $3, $4, $5, "|", "Login/logout time: ", $6, $7, $8, $9}' | column -ts '|'

    # To separate the outputs between users more clearly:
    echo "-------"

    done
}