#!/bin/bash

# Function for starting, stopping, or viewing status of web server.
# Function called in SystemAdmin.sh-file.
webServerFunction()
{
    echo "You will now get three choices, type the number of the desired operation into the terminal."
    echo "1: View web server status."
    echo "2: Start web server."
    echo "3: Stop web server."

    read webServerChoice

    case $webServerChoice in
        1)
            echo "You have chosen to view the status of the web server."

            # Command for viewing web server status:
            sudo systemctl status apache2
            ;;
        2)
            echo "You have chosen to start the web server."

            # Check if the web server is already running:
            # Save the status of the webserver in a command.
            webServerStatusStart1=$(sudo systemctl status apache2 | grep "Active" | awk '{ print $2 }')

            # Run the variable through an if statement.
            if [ "$webServerStatusStart1" == "active" ]; then
                echo "The web server is already running."
                # Exits if it is already running and continues if not.
                return 0 
            fi

            # Command for starting web server:
            sudo systemctl start apache2

            # Check if webserver is actually running after starting it:
            # We save the status in a variable.
            webServerStatusStart2=$(sudo systemctl status apache2 | grep "Active" | awk '{ print $2 }')
            
            # We check using an if statement.
            if [ "$webServerStatusStart2" == "active" ]; then
                #Confirm to the user that web server is running.
                echo "The web server has successfully been started."
            else
                echo "Something went wrong in starting the webserver."
            fi
            ;;
        3)
            echo "You have chosen to stop the web server."

            # Make sure web server is not already inactive:
            # Save status in a variable.
            webServerStatusStop1=$(sudo systemctl status apache2 | grep "Active" | awk '{ print $2 }')

            # We check the variable using an if statement:
            if [ "$webServerStatusStop1" == "inactive" ]; then
                echo "The web server does not need to be stopped as it is already inactive."
                # Exits if it is inactive, keeps running if active.
                return 0
            fi

            # Command for stopping web server:
            sudo systemctl stop apache2

            # Make sure web server is actually stopped:
            # Save status in a variable.
            webServerStatusStop2=$(sudo systemctl status apache2 | grep "Active" | awk '{ print $2 }')

            # We check the variable using an if statement:
            if [ "$webServerStatusStop2" == "inactive" ]; then
                echo "The web server was succesfully stopped."
            else
                echo "Something went wrong with stopping the web server."
            fi
            ;;
            
        *)
            echo "Invalid choice."
            ;;
    esac
}