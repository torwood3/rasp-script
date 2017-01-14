#!/bin/sh

#curl -Lo- https://raw.githubusercontent.com/torwood3/rasp-script/master/setup.sh | bash

echo "Doing Debian Updates (slow) ..."
sudo aptitude -y update
sudo aptitude -y upgrade
sudo aptitude -y dist-upgrade
sudo aptitude -y autoclean
sudo aptitude -y full-upgrade

echo "Installing Raspberry Pi Packages"
sudo aptitude -y libraspberrypi-bin libraspberrypi0 raspberrypi-bootloader libraspberrypi-doc libraspberrypi-dev

echo "Installing Base Packages"
sudo aptitude -y install libgl1-mesa-dri libparse-debianchangelog-perl uuid-runtime xfonts-base gnupg-curl oss-compat upower libreadline5 sysv-rc-conf sysstat build-essential

echo "Installing Languages"
sudo aptitude -y install python

echo "Installing web server"
sudo aptitude -y install nginx

echo "Installing Let's Encrypt"
udo apt-get install certbot -t jessie-backports

echo "Installing Development Environment"
sudo aptitude -y install git git-all

echo "Installing System/Security"
sudo aptitude -y install libpcap-dev bridge-utils tcpdump tor nmap fail2ban

echo "Doing Debian Updates (slow) ..."
sudo aptitude -y update
sudo aptitude -y upgrade
sudo aptitude -y dist-upgrade
sudo aptitude -y autoclean
sudo aptitude -y full-upgrade

git clone https://github.com/torwood3/rasp-script.git /home/pi/scripts

