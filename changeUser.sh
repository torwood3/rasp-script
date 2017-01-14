#!/bin/sh

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Setup for raspberry"

echo "User"
read -p "What name for the new pi?" newuser
adduser $newuser

for i in `groups pi`
do
    if [ "$i" != ":" ]; then
		adduser $newuser $i
    fi
done

echo "Suppression of the pi user"
deluser pi

echo "Block ssh for root"
echo "PermitRootLogin no" >> /etc/ssh/sshd_config

echo "Reboot of SSH"
/etc/init.d/sshd restart

