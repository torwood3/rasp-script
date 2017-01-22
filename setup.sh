#!/bin/sh
#echo "Doing Debian Updates (slow) ..."
sudo aptitude -y update
sudo aptitude -y upgrade
sudo aptitude -y dist-upgrade
sudo aptitude -y autoclean
sudo aptitude -y full-upgrade

#echo "Installing Raspberry Pi Packages"
sudo aptitude -y libraspberrypi-bin libraspberrypi0 raspberrypi-bootloader libraspberrypi-doc libraspberrypi-dev

#echo "Installing Base Packages"
sudo aptitude -y install libgl1-mesa-dri libparse-debianchangelog-perl uuid-runtime xfonts-base gnupg-curl
sudo aptitude -y install oss-compat upower libreadline5 sysv-rc-conf sysstat build-essential

echo "Installation of base finish" >> /home/pi/installation-steps
sudo aptitude -y install apt-transport-https

#echo "Installing Languages"
sudo aptitude -y install python

#echo "Installing web server"
sudo aptitude -y install nginx

#echo "Installing Development Environment"
sudo aptitude -y install git git-all

#echo "Installing System/Security"
sudo aptitude -y install libpcap-dev bridge-utils tcpdump nmap fail2ban

#echo "Doing Debian Updates (slow) ..."
sudo aptitude -y update
sudo aptitude -y upgrade
sudo aptitude -y dist-upgrade
sudo aptitude -y autoclean
sudo aptitude -y full-upgrade

echo "Installation finish" >> /home/pi/installation-steps

echo "Hello in your up to date raspberry !

To continue the installation git clone https://github.com/torwood3/rasp-script.git and run step1.sh" > /etc/motd

echo "default" | passwd root --stdin > /dev/null
