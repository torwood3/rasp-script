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


echo "Reconnect as $username"













