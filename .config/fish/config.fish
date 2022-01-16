
set -x TODO_DIR /home/carlos/Dropbox/todo
set -x TODO_FILE $TODO_DIR/todo.txt
set -x DONE_FILE $TODO_DIR/done.txt
set -x PATH $PATH /home/carlos/scripts:/home/carlos/.cargo/bin:$HOME/opt/eclipse/jee-2021-09/eclipse $HOME/.emacs.d/bin

#starship init fish | source
# Powerline
function fish_prompt
  powerline-shell --shell bare $status
end

setxkbmap -layout br,apl,br -variant abnt2,dyalog -option grp:switch
wal -i ~/.config/bspwm/wallpaper.png -q

cd /home/carlos
