#!/bin/bash

# Function for deleting existing user groups.
# Function has been called in ChoiceFunctions.sh-file.
deleteGroup(){
    echo "Type in the name of the user group you wish to delete into the terminal: "
    read deleteGroup

    # Check username for getent errors to establish whether it exists or not.
    getent group "$deleteGroup" >/dev/null
    exitCode=$?
    
    case $exitCode in
        0)
            # Exit code 0 means success.
            # This means the group already exists and can be deleted.
            sudo groupdel $deleteGroup
            echo "The group $deleteGroup has been successfully deleted."
            ;;
        1)
            # Exit code 1 means missing arguments.
            echo "Error: missing arguments."
            ;;
        2)
            # Exit code 2 means entries were not found.
            # This means the group does not exist and cannot be deleted.
            echo "The group $deleteGroup is not an existing user group."
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