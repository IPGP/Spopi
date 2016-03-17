Spopi can only work on Raspberry Pi 2 and 3

# Installation

## Raspbian 2016-02-26
Download last Raspbian Jessie img [here](https://www.raspberrypi.org/downloads/raspbian/)
* [Install Raspbian on Mac](https://www.raspberrypi.org/documentation/installation/installing-images/mac.md)
* [Install Raspbian on Linux](https://www.raspberrypi.org/documentation/installation/installing-images/linux.md)
* [Install Windows on Linux](https://www.raspberrypi.org/documentation/installation/installing-images/windows.md)

Then you can insert the µSD card in the Raspberry Pi 2 or 3

## Default keyboard configuration 
sudo raspi-config
=> International option and change keyboard layout if needed. Default is english
=> expand filesystem

Then you can reboot the Raspberry 

## Network
To set DHCP on the network interface
Replace in /dev/network/interface/ 

````iface eth0 inet manual````

by

````
auto eth0
iface eth0 inet dhcp
````

 If you want static IP address, you have to replace in /dev/network/interface/ 

````iface eth0 inet manual````

by

````
auto eth0
iface eth0 inet static
        address 192.168.2.16
        netmask 255.255.255.0
        gateway 192.168.2.1
        dns-nameservers 192.168.2.1
````
And then relaunch the network with 
````sudo service networking restart````
Now you can test the network:
````ping www.ipgp.fr````

## Spopi installation
 ````
wget -O /tmp/spopi_install.bash https://raw.githubusercontent.com/IPGP/Spopi/master/spopi_install.bash 
or
wget -O /tmp/spopi_install.bash https://goo.gl/bEwmmC

bash /tmp/spopi_install.bash
````
It last between 10 and 20 minutes. At the end, you just have to reboot and enjoy !
````sudo reboot````
The stations plots will appears few seconds after reboot. Be patient !

## Spopi

They are two simple example of Spopi usage in /home/pi/visu:
### drum-line
2/3 of the screen with a drum plot and 1/3 of the screen with a line plot

### two-drums
half of the screen with a station, the other half with another one

### three-lines
3 line-plot stations

You can modify them and choose which of those programs will start at the end of /home/pi/visu/screen_on.bash

## Crontab
Visualisation is set to start at boot and at 08h00 TU. It will automaticaly stop at 17h00 TU.
You can change start and end of visualisation by editing the crontab:
````crontab -e````

## Modify the settings 
You can either connect to the Raspberry with ssh (user is pi and default password is raspberry) or [change tty](http://www.ehow.com/how_7765949_switch-tty.html)
