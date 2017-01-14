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


echo "Change root password"
sudo passwd root

echo "Change to root"
su

echo "Suppression of the pi user"
sudo deluser pi

echo "Block ssh for root"
sudo echo "PermitRootLogin no" >> /etc/ssh/sshd_config

sudo /etc/init.d/sshd restart












