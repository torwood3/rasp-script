#!/bin/sh

calc_wt_size() {
  WT_HEIGHT=17
  WT_WIDTH=$(tput cols)

  if [ -z "$WT_WIDTH" ] || [ "$WT_WIDTH" -lt 60 ]; then
    WT_WIDTH=80
  fi
  if [ "$WT_WIDTH" -gt 178 ]; then
    WT_WIDTH=120
  fi
  WT_MENU_HEIGHT=$((WT_HEIGHT-7))
}

do_tools() {
FUN=$(whiptail --backtitle "Step2" --title "Install specific packages" --menu "Tech and tool" "$WT_HEIGHT" "$WT_WIDTH" "$WT_MENU_HEIGHT" --cancel-button Back --ok-button Select \
"1 Install Docker" \
"2 Install Let's Encrypt" \
"3 Install NodeJS" "" \
  3>&1 1>&2 2>&3)
RET=$?
if [ $RET -eq 1 ]; then
  return 0
elif [ $RET -eq 0 ]; then
  case "$FUN" in
    1\ *) do_docker ;;
    2\ *) do_letsecnrypt ;;
    3\ *) do_nodejs ;;
    *) whiptail --msgbox "Programmer error: unrecognized option" 20 60 1 ;;
  esac || whiptail --msgbox "There was an error running option $FUN" 20 60 1
else
 exit 1
fi
}

do_nodejs() {
    wget https://nodejs.org/dist/v6.9.4//node-v6.9.4-linux-armv6l.tar.gz
    tar -xzf node-v6.9.4-linux-armv6l.tar.gz
    cd node-v6.9.4-linux-armv6l/
    sudo cp -R * /usr/local/
    export PATH=$PATH:/usr/local/bin
}

do_docker(){
    apt-get install certbot -t jessie-backports -y
}

do_letsecnrypt(){
    apt-get install certbot -t jessie-backports -y
}




echo ""
echo "************** root ***************"
echo "Change root password"
rootpwd=$(whiptail --title "Root" --inputbox "Root password ?" 10 60 Morgan 3>&1 1>&2 2>&3)

echo $rootpwd | passwd root --stdin > /dev/null

echo "Suppression of the pi user"
deluser pi

bash -c "echo '' > /etc/motd"

calc_wt_size
do_tools
