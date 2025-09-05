#!/bin/bash

# Function for auditing registered users and their last login.
# Function is called in SystemAdmin.sh-file.
auditing(){
    echo "Viewing users by: "
    echo "| name | session |   hostname       |   date and time   |     logout      |"
    last | grep -v "reboot"
}
