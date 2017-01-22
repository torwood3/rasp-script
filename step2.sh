#!/bin/sh

echo "Suppression of the pi user"
deluser pi

bash -c "echo '' > /etc/motd"

read -p "Installation of NodeJS ? [Y/n]" yn
if [$yn -ne n]
then
    wget https://nodejs.org/dist/v6.9.4//node-v6.9.4-linux-armv6l.tar.gz
    tar -xzf node-v6.9.4-linux-armv6l.tar.gz
    cd node-v6.9.4-linux-armv6l/
    sudo cp -R * /usr/local/
    export PATH=$PATH:/usr/local/bin
fi

echo "************************"
echo "Installing Let's Encrypt"
read -p "Installation of Let's Encrypt ? [Y/n]" $yn
if [$yn -ne n]
then
    apt-get install certbot -t jessie-backports -y
fi

