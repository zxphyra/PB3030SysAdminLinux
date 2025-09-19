#!/bin/bash

# Function for adding google auth as 2FA for users:
# Function called in ChoiceFunction.sh
googleAuthentication(){
    echo "Type in the username of the user you are enabling 2FA for into the terminal: "
    read authUser

    getent passwd "$authUser" >/dev/null
    exitCode=$?
    
    case $exitCode in
        0)
            # Exit code 0 means success.
            # This means the username exists and 2FA can be anabled for them.
            echo "The user exists."

            # Check if the user has the .google_authenticator file already
            sudo test -f ~$authUser/.google_authenticator && echo "yes" || echo "no"
            read authExists

            if [ $authExists == "yes"]; then
                echo "User already has 2FA"
            elif [ $authExists == "no" ]; then
                echo "User does not have 2FA"
            else
                echo "An error occured."
            fi
            ;;
        1)
            # Exit code 1 means missing arguments.
            echo "Error: missing arguments."
            ;;
        2)
            # Exit code 2 means entries were not found.
            # This means the user does not exist.
            echo "User $authUser is not a valid username."
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