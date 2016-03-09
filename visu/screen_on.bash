#!/bin/bash

sudo /usr/bin/tvservice -p
sudo /bin/chvt 9 && sudo /bin/chvt 7

xset -dpms -d :0
xset s off


#kill all previous seedlink-plotter
/usr/bin/killall seedlink-plotter
/usr/bin/killall python
/usr/bin/killall screen_on.bash
/usr/bin/killall ssh

/home/pi/visu/drum-line
/home/pi/visu/two-drums

