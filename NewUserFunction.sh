#!/bin/bash

source SystemEmail.txt

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
            sudo adduser $newUsername

            echo "User $newUsername has successfully been created."

            emailSubject="Welcome $newUsername!"

            # Send email to new user:
            # Use SystemEmail.txt as the body of the email.
            mail -s "$emailSubject" $newUsername < SystemEmail.txt
            
            echo "Welcome email sent to $newUsername."
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