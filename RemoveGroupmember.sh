#!/bin/bash

# Function for removing individual users from user groups.
# Function called in ChoiceFunctions.sh
removeGroupmember(){
    echo "Type the username of the user you wish to remove from a group into the terminal: "
    read removeMemberUsername

    # Check is username exists:
    getent passwd "$removeMemberUsername" >/dev/null
    exitCode1=$?

    case $exitCode1 in
        0)
            # Exit code 0 means success.
            # This means the user does indeed exist.
            # We continue.
            ;;
        2)
            # Exit code 2 means entry not found.
            # This means the user does not exist.
            echo "User $removeMemberUsername is not an existing username."
            return 1
            ;;
        *)
            # Other exit codes signifies an error.
            echo "An error has occured."
            return 1
            ;;
    esac

    echo "Type in the group name of the group you wish to remove $removeMemberUsername into the terminal: "
    read removeMemberGroup

    #Check if the group exists:
    getent group "$removeMemberGroup" >/dev/null
    exitCode2=$?

    case $exitCode2 in
        0)
            #Exit code 0 means success.
            #This means the group does indeed exists.
            # We continue.
            ;;
        2)
            # Exit code 2 means entries not found.
            # This means the group does not exist.
            echo "User $removeMemberGroup is not an existing group."
            return 1
            ;;
        *)
            # Other exit codes signifies an error.
            echo "An error occured."
            return 1
            ;;
    esac

    #Checking if the user is already a member in the group:
    if groups $removeMemberUsername | grep -qw $removeMemberGroup; then
        # They can be removed from the group.
        sudo deluser $removeMemberUsername $removeMemberGroup
        echo "User $removeMemberUsername has been successfully removed from group $removeMemberGroup."
    else
        # The user is not a member of the group and cannot be removed.
        echo "User $removeMemberUsername is not a member of group $removeMemberGroup."
    fi
}