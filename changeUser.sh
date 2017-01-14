#!/bin/sh

echo "Setup for raspberry"

echo "User"
read -p "What name for the new pi?" newuser
sudo adduser $newuser

for i in `groups pi`
do
    if [ "$i" != ":" ]; then
		sudo adduser $newuser $i
    fi
done

echo "Suppression of the pi user"
sudo deluser pi

echo "Change root password"
sudo passwd root

echo "Block ssh for root"
sudo echo "PermitRootLogin no" >> /etc/ssh/sshd_config

sudo /etc/init.d/sshd restart












