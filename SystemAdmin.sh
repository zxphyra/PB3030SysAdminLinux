#!/bin/bash

source SystemAdministrationChoiceFunctions.sh
source SystemAdminFunctions.sh

echo "Welcome to the system administrator management program."
echo "You will now get some options for different operations."
echo "Type the number of the operation you wish to do into the terminal: "

echo "1: User Management."
echo "2: Webserver Management."
echo "3: Review Logs"

read choice


case $choice in
    1)
        echo "You have chosen user management."
        echo "You will be given multiple options for valid operations."
        echo "Type the number of the operation you wish to execute into the terminal: "

        echo "1: Create or delete group."
        echo "2: Create or delete user."
        echo "3: Change group for an individual user."
        echo "4: Change authentication method for an individual user."

        read user_choice

        userChoiceFunction
        ;;
    2)
        echo "You have chosen webserver management."
        echo "You will be given two options."
        echo "Type in the number of the operation you wish to do into the terminal: "

        echo "1: Start web server."
        echo "2: Stop web server."

        read webserver_choice

        webserverChoiceFunction
        ;;
    3)
        echo "You have chosen to review logs."
        # Log function.
        ;;
    *)
        echo "Invalid choice."
esac
