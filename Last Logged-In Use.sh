#!/bin/bash
# Get the last logged-in user, excluding system users and reboots/shutdowns

lastLoggedInUser=$(last -1 -t console | awk '{print $1}' | grep -vE 'reboot|shutdown|^$')
echo "<result>${lastLoggedInUser}</result>"
