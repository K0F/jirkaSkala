#!/bin/bash
export PATH=$PATH:/usr/bin:/usr/local/bin/:/usr/sbin

sleep 30s

. /etc/profile
. /home/user/.profile
. /home/user/.bashrc

export XAUTHORITY=/home/kof/.Xauthority
export DISPLAY=':0'

xrandr --output LVDS1 --auto --primary
xrandr --output HDMI1 --noprimary --right-of LVDS1 --mode 1920x1080

sleep 2s

xset -dpms
xset s off

(/usr/bin/feh -x -g 1920x1080+1366+0 /home/user/black.png > /dev/null 2>&1 &)&

cd /home/user/media

while true
do
ls | grep mov | sort -R > playlist.txt
for i in `cat playlist.txt`; do
if [[ $i == *"jpg"* ]]
then
/usr/bin/mplayer -vo gl -nocache -geometry 1920x1080+1367+1 -fs "$i" > /dev/null 2>&1 & 
sleep `shuf -i1-7 -n1`s
else
/usr/bin/mplayer -vo gl -nocache -geometry 1920x1080+1367+1 -ss $((RANDOM%60)) -fs "$i" > /dev/null 2>&1 &
sleep `shuf -i7-20 -n1`s
fi
killall mplayer
done
done

#for i in `ls` ; do (feh -F "$i" & sleep 5s && pkill feh) || (mplayer -fs "$i" & sleep 5s && pkill mplayer) ; done
#for i in `ls` ; do (feh -F "$i" & sleep 5s && pkill feh) ; done
#gwenview -s /home/user/media
