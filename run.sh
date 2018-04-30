#!/usr/bin/env bash

#Setup sockets
gnome-terminal -e "socat -d -d pty,raw,echo=0 pty,raw,echo=0"
gnome-terminal -e "socat -d -d pty,raw,echo=0 pty,raw,echo=0"
read -p "Enter first socat in: " firstin
read -p "Enter first socat out: " firstout
read -p "Enter second socat in: " secondin
read -p "Enter second socat out: " secondout

#Start Simulators
echo $PWD
gnome-terminal --working-directory "$PWD/simulators" -e "./MsgCreator.py > /dev/pts/$firstin"
gnome-terminal --working-directory "$PWD/simulators" -e "./RGBMatrix.py < /dev/pts/$secondout"
cmake .
make SINF
gnome-terminal -e "./SINF /dev/pts/$firstout /dev/pts/$secondin"