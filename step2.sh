#!/bin/sh

echo "Suppression of the pi user"
sudo deluser pi

sudo bash -c "echo '' > /etc/motd"