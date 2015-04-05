#!/bin/bash
#MADE BY andrea@khanitech.net

NEWLINE=$'\n'
green=$’\033[00;32m’
red=$’\033[00;31m’
blue=$’\033[00;34m’
endColor=$’\033[0m’

echo "${green}Khanitech Server Installer${endColor}${red} [made by Andrea]${endColor}"

#installing and setting up APACHE w/ a process indicator
while true; do
        read -p "Do you want to install APACHE (L[A]MP)? Y/N:" yn
        case $yn in
                [Yy]* ) echo -n "Installing & configuring" && yum install httpd && service httpd start && chkconfig httpd on yum install; break;;
                [Nn]* ) exit;;
                * ) echo "Please answer yes or no.";;
        esac
done
echo "Apache is installed"


#Installing MariaDB
while true; do
	read -p "Do you want to install MariaDB (LA[M]P)? Y/N:" yn
	case $yn in
	#add mariadb repo to system & update
		[Yy]* ) echo -n "Installing & configuring" && cp MariaDB.repo etc/yum.repos.d; break;;
#Install MariaDB
yum update &&  yum install MariaDB-devel MariaDB-client MariaDB-server; break;;		
		[Nn]* ) exit;;
		* ) echo "Please answer yes or no.";;
	esac
done
echo "MariaDB and dependecies are installed."


#installing PHP+ dependecies for other software using php
while true; do
        read -p "Do you want to install PHP (LAM[P])? Y/N:" yn
        case $yn in
                [Yy]* ) echo -n "Installing & configuring" && yum install php php-devel php-mysql; break;;
                [Nn]* ) exit;;
                * ) echo "Please answer yes or no.";;
        esac
done
echo "PHP is installed"


#Install basic monitoring tools for the system
while true; do
        read -p "Do you want to install monitoring tools (atop, htop iftop, lm-sensors)? Y/N:" yn
        case $yn in
                [Yy]* ) echo -n "Installing & configuring" && yum install atop htop iftop lm-sensors; break;;
                [Nn]* ) exit;;
                * ) echo "Please answer yes or no.";;
        esac
done

#Give a last output to inform of the steps left for the install
echo "${red}There is additional steps left for MariaDB, to make it work properly. It needs to be set up with a password! Run '/usr/bin/mysql_secure_installation' to set a password using the programs wizard.${NEWLINE}lm-sensors also needs a bit more setup, run sensors-detect to make it find the systems different sensors.${endColor}"
