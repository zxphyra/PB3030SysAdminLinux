#!/bin/bash

# Function for auditing registered users and their last login.
# Function is called in SystemAdmin.sh-file.
auditing(){
    # Make an array of users:
    userArray=($(cat /etc/passwd | grep '/home' | cut -d: -f1))

    for user in "${userArray[@]}"; do
        echo "User $user: "

        groupArray=($(grep $user /etc/group | cut -d: -f1))
        for group in "${groupArray[@]}"; do
            if [ "$group" == "$user" ]; then
                echo "Member in: $group (primary group)"
            else
                echo "Member in: $group"
            fi
        done

    # To separate the outputs of users more clearly
    echo "---"

    done
}