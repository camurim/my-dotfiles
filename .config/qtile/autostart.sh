#!/usr/bin/env bash

USER=${USER:-carlos}
HOME=${HOME:-/home/$USER}

#░█░█░█▀▀░█░█░█▀▄░█▀█░█▀█░█▀▄░█▀▄░░░█▀▄░█▀▀░█▄█░█▀█░█▀█
#░█▀▄░█▀▀░░█░░█▀▄░█░█░█▀█░█▀▄░█░█░░░█▀▄░█▀▀░█░█░█▀█░█▀▀
#░▀░▀░▀▀▀░░▀░░▀▀░░▀▀▀░▀░▀░▀░▀░▀▀░░░░▀░▀░▀▀▀░▀░▀░▀░▀░▀░░

# Map CAPS to SUPER and SCROLL LOCK to None
setxkbmap -layout br -variant abnt2 -option grp:switch
setxkbmap -option caps:super
xmodmap -e 'keycode 78='

#░█░█░█▀█░█░░░█░░░█▀█░█▀█░█▀█░█▀▀░█▀▄
#░█▄█░█▀█░█░░░█░░░█▀▀░█▀█░█▀▀░█▀▀░█▀▄
#░▀░▀░▀░▀░▀▀▀░▀▀▀░▀░░░▀░▀░▀░░░▀▀▀░▀░▀

currentGnomeBackground=$(gsettings get org.gnome.desktop.background picture-uri | sed "s/['\"]//g")
if [ "$currentGnomeBackground" != "file:///home/$USER/.config/qtile/wallpaper6.jpg" ]; then
	gsettings set org.gnome.desktop.background picture-uri "file:///home/$USER/.config/qtile/wallpaper6.jpg" 2>/dev/null
fi

# ░█▀▀░▀█▀░█▀█░█▀▄░▀█▀░█░█░█▀█
# ░▀▀█░░█░░█▀█░█▀▄░░█░░█░█░█▀▀
# ░▀▀▀░░▀░░▀░▀░▀░▀░░▀░░▀▀▀░▀░░

xsetroot -cursor_name left_ptr &

numlockx on

unclutter &

pgrep compton
if [ $? -eq 0 ]; then
	pkill -USR1 -x compton
fi

compton --experimental-backends &

pgrep emacs
if [ $? -eq 1 ]; then
  /usr/local/bin/emacs --daemon &
fi

pgrep conky
if [ $? -eq 0 ]; then
	killall conky &
	sleep 3 && conky -b -c $HOME/.config/conkyrc &
else
	conky -b -c $HOME/.config/conkyrc &
fi

pgrep gnome-screensaver
if [ $? -eq 1 ]; then
	gnome-screensaver &
fi

pgrep xss-lock
if [ $? -eq 1 ]; then
	xset s on
	xset s 600 # 10 minutos de inatividade
	xss-lock -l -- /usr/bin/gnome-screensaver-command --lock &
fi

 
