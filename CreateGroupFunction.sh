#!/bin/bash

# Function for creating a new user group.
# Function has been called in ChoiceFunctions.sh-file.
createGroup(){
    echo "Type in the name of the new user group into the terminal: "
    read newGroup

    # Check username for getent errors to establish whether it exists or not.
    getent group "$newGroup" >/dev/null
    exitCode=$?
    
    case $exitCode in
        0)
            # Exit code 0 means success.
            # This means the group already exists.
            echo "Group $newGroup already exists."
            ;;
        1)
            # Exit code 1 means missing arguments.
            echo "Error: missing arguments."
            ;;
        2)
            # Exit code 2 means entries were not found.
            # This means a group with that name does not exists and can be created.
            sudo groupadd $newGroup
            echo "A new group named $newGroup has been created."
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