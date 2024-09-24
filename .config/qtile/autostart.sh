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
xmodmap -e "pointer = 1 25 3 4 5 6 7 8 9"

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

pgrep gromit-mpx
if [ $? -eq 1 ]; then
	gromit-mpx --key F10 &
fi

# Screensaver
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

# Configurações do Tablet Wacom
if xsetwacom --list devices | grep -q 'Wacom Intuos S Pad'; then
	firstDevice=$(xsetwacom --list devices | head -n 1 | awk -F ':' '{print $2}' | cut -c '1-3')
	
	xsetwacom --set "Wacom Intuos S Pen stylus" Button 2 "pan"
	xsetwacom --set "Wacom Intuos S Pen stylus" "PanScrollThreshold" 200
	xsetwacom --set "$((firstDevice + 0))" MapToOutput DP-2
	xsetwacom --set "$((firstDevice + 1))" MapToOutput DP-2
	xsetwacom --set "$((firstDevice + 2))" MapToOutput DP-2
fi

# Saudações ao iniciar o sistema
horaAtual=$(date '+%H')
periodo="bom dia"

if ((horaAtual >= 12 && horaAtual < 18)); then
	periodo="boa tarde"
elif ((horaAtual >= 18)); then
	periodo="boa noite"
fi

speak-ng -v mb/mb-br4 -s 124 -a 200 "$periodo Carlos, seja bem vindo!"
