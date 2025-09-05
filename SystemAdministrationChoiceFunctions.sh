#!/bin/bash

userChoiceFunction(){
    case $user_choice in
        1)
            echo "You have chosen to create or delete a group."
            # Group management function.
            ;;
        2)
            echo "You have chosen to create or delete a user."
            # User management function.
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
