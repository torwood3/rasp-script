#!/bin/sh
#
# VERSION=1.0.0
#
# Whiptail menu to install raspberry tools

echo "Setup for raspberry"

echo "************** User ***************"
newuser=$(whiptail --title "User" --inputbox " User name ?" 10 60 Morgan 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    sudo adduser $newuser

    for i in `groups pi`
    do
        if [ "$i" != ":" ]; then
            sudo adduser $newuser $i
        fi
    done
else
    echo "You cancelled :("
fi


echo "Block ssh for root"
echo "=> do sudo nano /etc/ssh/sshd_config"
echo "then change PermitRootLogin yes to no"
echo "add AllowUsers $newuser at the end of the file"

echo "Reconnect as $newuser and run step2.sh"













