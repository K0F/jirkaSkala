#!/bin/bash

export PATH=$PATH:/usr/bin:/usr/local/bin/:/usr/sbin


#sleep 30s

. /etc/profile
. /home/user/.profile
. /home/user/.bashrc

export DISPLAY=:0

xrandr --output LVDS1 --auto --primary
xrandr --output HDMI1 --noprimary --right-of LVDS1 --mode 1920x1080
#xrandr --output HDMI1 --right-of LVDS1 --mode 1920x1080 --primary

xset -dpms
xset s off

cd /home/user/media

#(while true; do (sleep 10s && xdotool key Return) ; done)&

while true
do
ls | grep mov | sort -R > playlist.txt
for i in `cat playlist.txt`; do
if [[ $i == *"jpg"* ]]
then
/usr/bin/mplayer -vo gl -geometry 1920x1080+1367+1 -fs -fixed-vo $i > /dev/null 2>&1 & sleep 10s && pkill mplayer
else
/usr/bin/mplayer -vo gl -geometry 1920x1080+1367+1 -ss $((RANDOM%60)) -fs -fixed-vo $i > /dev/null 2>&1 & sleep 10s && pkill mplayer
fi
done
done

#for i in `ls` ; do (feh -F "$i" & sleep 5s && pkill feh) || (mplayer -fs "$i" & sleep 5s && pkill mplayer) ; done
#for i in `ls` ; do (feh -F "$i" & sleep 5s && pkill feh) ; done
#gwenview -s /home/user/media
