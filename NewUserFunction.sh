#!/bin/bash

# Function for creating new user.
# Function called in ChoiceFunctions.sh-file.
newUser(){
    echo "Type in the username of the new user into the terminal: "
    read newUsername

    getent passwd "newUser"
}