#!/bin/bash

apt-get update

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
sudo echo '@xset s noblank' >> /home/pi/.config/lxsession/LXDE-pi/autostart
sudo echo '@xset s off' >> /home/pi/.config/lxsession/LXDE-pi/autostart
sudo echo '@xset -dpms' >> /home/pi/.config/lxsession/LXDE-pi/autostart
sudo echo '@/home/pi/visu/screen_on.bash' >> /home/pi/.config/lxsession/LXDE-pi/autostart
