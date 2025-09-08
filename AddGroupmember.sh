#!/bin/bash

#Function for adding user to a group.
#Function called in ChoiceFunctions.sh

addGroupmember(){
    echo "Type in the username of the user you wish to add to a group into the terminal: "
    read addMemberUsername

    # Check if user exists:
    getent passwd "$addMemberUsername" >/dev/null
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
            echo "User $addMemberUsername is not an existing username."
            return 1
            ;;
        *)
            # Other exit codes signifies an error.
            echo "An error has occured."
            return 1
            ;;
    esac

    echo "Type in the group to which you wish to add $addMemberUsername: "
    read addMemberGroup

    #Check if group exists:
    getent group "$addMemberGroup" >/dev/null
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
            echo "User $addMemberGroup is not an existing group."
            return 1
            ;;
        *)
            # Other exit codes signifies an error.
            echo "An error occured."
            return 1
            ;;
    esac
    
    #Checking if the user is already a member in the group:
    if groups $addMemberUsername | grep -qw $addMemberGroup; then
        # They are indeed already in the user group.
        echo "User $addMemberUsername is already a member of $addMemberGroup."
    else
        # They can be added to the group.
        sudo adduser $addMemberUsername $addMemberGroup
        echo "User $addMemberUsername has successfully been added to group $addMemberGroup."
    fi
}