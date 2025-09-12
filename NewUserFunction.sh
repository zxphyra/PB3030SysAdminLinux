#!/bin/bash

# Function for creating new user.
# Function called in ChoiceFunctions.sh-file.
newUser(){
    echo "Type in the username of the new user into the terminal: "
    read newUsername

    getent passwd "$newUsername" >/dev/null
    exitCode=$?
    
    case $exitCode in
        0)
            # Exit code 0 means success.
            # This means the username already exists in the system.
            echo "The username $newUsername is already in use."
            ;;
        1)
            # Exit code 1 means missing arguments.
            echo "Error: missing arguments."
            ;;
        2)
            # Exit code 2 means entries were not found.
            # This means the username is unique and the user can be created.
            sudo useradd $newUsername

            # Add a password for the new user.
            echo "Type in the password for the user $newUsername."
            sudo passwd $newUsername

            echo "User $newUsername has successfully been created."

            # Send email to new user
            header="Welcome $newUsername!"
            body=
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