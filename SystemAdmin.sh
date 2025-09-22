#!/bin/bash

#Sources:
source ChoiceFunctions.sh
source AuditingFunction.sh
source StartStopWebServer.sh

# General greeting to user.
echo "Welcome to the system administrator management program."
echo "You will now get some options for different operations."
echo "Type the number of the operation you wish to do into the terminal: "

echo "1: User Management."
echo "2: Webserver Management."
echo "3: Auditing"

read choice

# User chooses what they wish to manage.
case $choice in
    1)
        echo "You have chosen user management."
        echo "You will be given multiple options for valid operations."
        echo "Type the number of the operation you wish to execute into the terminal: "

        echo "1: Create or delete group."
        echo "2: Create or delete user."
        echo "3: Add user to a group or remove user from a group."
        echo "4: Change authentication method for an individual user."

        read user_choice

        # Calls the function for choosing what user management operation to do.
        # Function location is in ChoiceFunctions.sh-file.
        userChoiceFunction
        ;;
    2)
        echo "You have chosen webserver management."
        # Calls the function for managing the Web Server.
        # Function located in StartStopWebserver.sh-file
        webServerFunction
        ;;
    3)
        echo "You have chosen auditing."
        auditing
        ;;
    *)
        echo "Invalid choice."
esac
