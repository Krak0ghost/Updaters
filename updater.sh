#!/bin/bash

function updater(){

        sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y

}

function install() {



    sudo apt install leafpad -y
    sudo apt install net-tools -y
    sudo apt install keepass2 -y
    sudo apt install nmap -y
    sudo apt install aircrack-ng -y
    sudo apt install ifupdown -y
    sudo apt install gnome-tweak-tool -y
    sudo apt install lua5.3 -y
    sudo apt install gparted -y
    sudo apt install ssh -y
    sudo apt install gitk -y

}

function snap_install() {

  snap install atom --classic
  snap install spotify

}

function lamp_install() {

  sudo apt install apache2 -y
  sudo apt install mysql-server -y
  sudo apt install phpmyadmin -y
  sudo apt install php -y

  sudo touch /var/www/html/test.php
  sudo chmod 777 /var/www/html/test.php
  sudo echo '<?php echo "Hello World"; ?>' >> /var/www/html/test.php

}

function ssh-key() {

  ssh-keygen

}

function install_msf() {

  curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
  chmod 755 msfinstall && \
./msfinstall

}

function install_docker() {

  sudo apt-get update

    sudo apt install apt-transport-https -y
    sudo apt install ca-certificates -y
    sudo apt install curl -y
    sudo apt install gnupg-agent -y
    sudo apt install software-properties-common -y

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    sudo apt-key fingerprint 0EBFCD88

    sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" -y

   sudo apt-get update

   sudo apt-get install docker-ce docker-ce-cli containerd.io -y

   sudo docker network create --subnet 192.168.0.0/16 --gateway 192.168.0.1 --ip-range=192.168.0.0/24 --driver=bridge bridge5

}

function wine_install() {

  sudo apt install q4wine -y
  sudo apt install wine-stable -y

  sudo dpkg --add-architecture i386

  wget -nc https://dl.winehq.org/wine-builds/winehq.key
  sudo apt-key add winehq.key 

  sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ cosmic main' -y

  sudo apt update

  sudo apt install --install-recommends winehq-stable -y

}

function reboot_system() {

 sudo reboot now

}


function main() {

  updater
  install
  ssh-key
  install_msf
  install_docker
  wine_install
  lamp_install
  reboot_system

}
main
