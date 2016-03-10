#!/bin/bash

sudo apt-get update

# Usefull packages installation
sudo apt-get install --force-yes -y python-matplotlib  python-lxml python-scipy vim mosh python-sqlalchemy python-suds python-tornado  subversion unclutter subversion xdotool dnsutils imagemagick libblas-dev liblapack-dev libatlas-base-dev gfortran libxslt1-dev tk-dev tk-dev tk8.6-dev tcl8.6-dev x11vnc htop
# Remove  unused packages
sudo apt-get --force-yes -y --purge remove   epiphany-.* scratch* sonic-pi libreoffice* claws-mail greenfoot bluej alacarte  wolfram-engine omxplayer python-picamera wpasupplicant
sudo apt-get autoremove

#remove unused directory
rm -fr /home/pi/Desktop /home/pi/Documents/ /home/pi/Downloads/ /home/pi/Music/ /home/pi/Pictures/ /home/pi/python_games/ /home/pi/Templates/ /home/pi/Videos/ /home/pi/Public/


# Obspy installation
if grep obspy /etc/apt/sources.list;
  then echo "Obspy depo already installed"
else
  echo "Obspy depo not installed, installing"
  sudo  echo  'deb http://deb.obspy.org jessie main' >> /etc/apt/sources.list
  sudo wget --quiet -O - https://raw.github.com/obspy/obspy/master/misc/debian/public.key | sudo apt-key add -
fi

sudo apt-get update
sudo  apt-get upgrade
sudo apt-get -y install python-obspy

#pip install lxml sqlalchemy

#Seedlink-plotter install
sudo pip install https://github.com/bonaime/seedlink_plotter/archive/master.zip

#updates
sudo apt-get --force-yes -y upgrade 

#Disable screen_saver 
sudo echo '@lxpanel --profile LXDE-pi
@pcmanfm --desktop --profile LXDE-pi
@sh ${HOME}/.config/lxsession/LXDE-pi/autokey.sh

@xset s noblank
@xset s off
@xset -dpms
@/home/pi/visu/screen_on.bash' > /home/pi/.config/lxsession/LXDE-pi/autostart

sed -i 's/BLANK_TIME=30/BLANK_TIME=0/'  /etc/kbd/config
sed -i 's/^POWERDOWN_TIME*/POWERDOWN_TIME=0/'  /etc/kbd/config

#Spopi files
mkdir /home/pi/visu
wget -O /home/pi/visu/drum-line  https://raw.githubusercontent.com/IPGP/Spopi/master/visu/drum-line
wget -O /home/pi/visu/screen_off.bash https://raw.githubusercontent.com/IPGP/Spopi/master/visu/screen_off.bash
wget -O /home/pi/visu/screen_on.bash https://raw.githubusercontent.com/IPGP/Spopi/master/visu/screen_on.bash
wget -O /home/pi/visu/two-drums https://raw.githubusercontent.com/IPGP/Spopi/master/visu/two-drums

chmod 755 /home/pi/visu/*

#Crontabs
(crontab -l ; echo "@reboot /usr/bin/unclutter -display :0 &") | crontab -
(crontab -l ; echo "# Spopi On") | crontab -
(crontab -l ; echo "00 04  * * *  DISPLAY=:0 /home/pi/visu/screen_on.bash  2>/tmp/cron_stderr 1>/tmp/cron_stdout") | crontab -
(crontab -l ; echo "# Spopi Off") | crontab -
(crontab -l ; echo "00 14  * * * /home/pi/visu/screen_off.bash") | crontab -

