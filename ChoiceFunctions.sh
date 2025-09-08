#!/bin/bash

# Sources:
source CreateGroupFunction.sh
source DeleteGroupFunction.sh
source NewUserFunction.sh
source DeleteUserFunction.sh

# Function to choose which operation to do in user management.
# The read variable is in the SystemAdmin.sh file.
userChoiceFunction(){
    case $user_choice in
        1)
            echo "You have chosen to create or delete a group."
            # Calls the function tho choose to create or delete group.
            groupCreateDelete
            ;;
        2)
            echo "You have chosen to create or delete a user."
            # Calls the function to choose to create or delete user.
            userCreateDelete
            ;;
        3)
            echo "You have chosen to change the group of an individual user."
            # Change group function
            ;;
        4)
            echo "You have chosen to change authentication method for a user."
            # User authentication function.
            ;;
        *)
            echo "Invalid choice."
        esac
}

# Function to choose to start or stop web server.
# The read variable is in the SystemAdmin.sh file.
webserverChoiceFunction(){
    case $webserver_choice in
        1)
            echo "You have chosen to start the webserver."
            # Webserver start function.
            ;;
        2)
            echo "You have chosen to stop the webserver."
            # Webserver stop function.
            ;;
        *)
            echo "Invalid choice."
            ;;
        esac
}

# Function to choose to create or delete groups.
groupCreateDelete(){
    echo "Type your desired operation into the terminal: "

    echo "1: Create new group."
    echo "2: Delete existing group."

    read choiceCreateDeleteGroup

    case $choiceCreateDeleteGroup in
        1)
            echo "You have chosen to create a new group."
            # Calls the function that creates a group.
            # Function location is in CreateGroupFunction.sh-file.
            createGroup
            ;;
        2)
            echo "You have chosen to delete an existing group."
            # Calls the function that deletes a group.
            # Function location is in DeleteGroupFunction.sh-file.
            deleteGroup
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
}

# Function to choose to create or delete user.
userCreateDelete(){
    echo "Type your desired operation into the terminal: "

    echo "1: Create new user."
    echo "2: Delete existing user."

    read choiceCreateDeleteUser

    case $choiceCreateDeleteUser in
        1)
            echo "You have chosen to create a new user."
            # Calls function that can create new user.
            # Function located in NewUserFunction.sh-file"
            newUser
            ;;
        2)
            echo "You have chosen to delete an existing user."
            # Calls function that can delete existing user.
            # Function located in DeleteUserFunction.sh-file.
            deleteUser
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
}