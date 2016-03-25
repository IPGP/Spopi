#!/bin/bash

sudo /usr/bin/tvservice -p
sudo /bin/chvt 9 && sudo /bin/chvt 7

xset -dpms -d :0
xset s off


#kill all previous seedlink-plotter
/usr/bin/killall seedlink-plotter
/usr/bin/killall python

# Force system time through NTP
/usr/bin/sudo /usr/bin/sntp -s pool.ntp.org

#Examples

#2/3 of the screen with a drum plot and 1/3 of the screen with a line plot
/home/pi/visu/drum-line

#half of the screen with a station, the other half with another one
#/home/pi/visu/two-drums


#3 line-plot stations
#/home/pi/visu/three-lines
