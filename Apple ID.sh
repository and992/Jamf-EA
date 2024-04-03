#!/bin/bash
sudo -u $(stat -f "%Su" /dev/console) /bin/sh <<'END'

#set variables for Apple ID account and existence check
AppleID=`defaults read MobileMeAccounts Accounts | grep "AccountID" | sed 's/        AccountID = "//' | sed 's/";//'`
AccountExists=`echo "$AppleID" | grep "@"`
ManagedCheck=`defaults read MobileMeAccounts Accounts | grep "isManagedAppleID" | sed 's/        isManagedAppleID = //' | sed 's/;//'`

#check if account exists and display associated email address and account type
if [ -z "$AccountExists" ]
    then 
        echo "<result>No Apple ID found</result>"
    else
        if [ "$ManagedCheck" == 0 ]
            then
		echo "<result>Personal Apple ID: $AppleID</result>"
            else
		echo "<result>Managed Apple ID: $AppleID</result>"
        fi
        
fi
