#!/bin/bash

# Function for deleting existing user.
# Function called in ?
deleteUser(){
    echo "Type in the username for the user you wish to delete into the terminal: "
    read deleteUser

    getent passwd "$deleteUser" >/dev/null
    exitCode=$?
    
    case $exitCode in
        0)
            # Exit code 0 means success.
            # This means the user exists and can be deleted.
            sudo deluser --remove-home $deleteUser
            echo "User $deleteUser has successfully been deleted."
            ;;
        1)
            # Exit code 1 means missing arguments.
            echo "Error: missing arguments."
            ;;
        2)
            # Exit code 2 means entries were not found.
            # This means the username was not found and the user does not exist.
            echo "User $deleteUser is not a valid username and cannot be deleted."
            ;;
        3)
            # Exit code 3 means enumeration error.
            echo "Error: Enumeration error."
            ;;
        *)
            echo "Something went really wrong."
            ;;
    esac
}