#!/bin/bash

apt-get update

# Usefull packages installation
sudo apt-get install --force-yes -y python-matplotlib  python-lxml python-scipy python-sqlalchemy python-suds python-tornado  subversion unclutter subversion xdotool dnsutils imagemagick libblas-dev liblapack-dev libatlas-base-dev gfortran libxslt1-dev tk-dev x11vnc
# Remove  unused packages
sudo apt-get --purge remove   epiphany-.* scratch* sonic-pi libreoffice* claws-mail greenfoot bluej alacarte  wolfram-engine omxplayer python-picamera wpasupplicant
sudo apt-get autoremove


#updates
sudo rpi-update
sudo apt-get update
sudo apt-get upgrade

# Obspy installation
sudo  echo  'deb http://deb.obspy.org jessie main' >> /etc/apt/sources.list
sudo wget --quiet -O - https://raw.github.com/obspy/obspy/master/misc/debian/public.key | sudo apt-key add -


sudo apt-get update
sudo  apt-get upgrade
sudo apt-get install python-obspy
pip install lxml sqlalchemy


sudo pip install https://github.com/bonaime/seedlink_plotter/archive/master.zip
