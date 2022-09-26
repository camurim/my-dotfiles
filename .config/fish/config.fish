#░█▀▀░█▀█░█░░░█▀█░█▀▄░█▀▀
#░█░░░█░█░█░░░█░█░█▀▄░▀▀█
#░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀

set -U COLOR_RESET "\033[0m"

set -U COLOR_K "\033[0;30m"    # black
set -U COLOR_R "\033[0;31m"    # red
set -U COLOR_G "\033[0;32m"    # green
set -U COLOR_Y "\033[0;33m"    # yellow
set -U COLOR_B "\033[0;34m"    # blue
set -U COLOR_M "\033[0;35m"    # magenta
set -U COLOR_C "\033[0;36m"    # cyan
set -U COLOR_W "\033[0;37m"    # white

# empahsized (bolded) colors
set -U EM_K "\033[1;30m"
set -U EM_R "\033[1;31m"
set -U EM_G "\033[1;32m"
set -U EM_Y "\033[1;33m"
set -U EM_B "\033[1;34m"
set -U EM_M "\033[1;35m"
set -U EM_C "\033[1;36m"
set -U EM_W "\033[1;37m"

# background colors
set -U BG_K "\033[40m"
set -U BG_R "\033[41m"
set -U BG_G "\033[42m"
set -U BG_Y "\033[43m"
set -U BG_B "\033[44m"
set -U BG_M "\033[45m"
set -U BG_C "\033[46m"
set -U BG_W "\033[47m"

#░█▀█░█▀█░▀█▀░█░█
#░█▀▀░█▀█░░█░░█▀█
#░▀░░░▀░▀░░▀░░▀░▀

### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/.cargo/bin $HOME/opt/eclipse/jee-2021-09/eclipse $HOME/.emacs.d/bin $HOME/.wakatime $HOME/.local/share/coursier/bin
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

#░█▀▀░█░█░█▀█░█▀█░█▀▄░▀█▀
#░█▀▀░▄▀▄░█▀▀░█░█░█▀▄░░█░
#░▀▀▀░▀░▀░▀░░░▀▀▀░▀░▀░░▀░

## TODO.txt configuration
set -x TODO_DIR /home/carlos/Dropbox/todo
set -x TODO_FILE $TODO_DIR/todo.txt
set -x DONE_FILE $TODO_DIR/done.txt

#set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type
set EDITOR "emacsclient -t -a ''"                 # $EDITOR use Emacs in terminal
set VISUAL "emacsclient -c -a emacs"              # $VISUAL use Emacs in GUI mode

### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### "vim" as manpager
# set -x MANPAGER '/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
# set -x MANPAGER "nvim -c 'set ft=man' -"

#░█▀▀░█▄█░█▀█░█▀▀░█▀▀░░░█▀█░█▀▄░░░█░█░▀█▀░░░█▄█░█▀█░█▀▄░█▀▀
#░█▀▀░█░█░█▀█░█░░░▀▀█░░░█░█░█▀▄░░░▀▄▀░░█░░░░█░█░█░█░█░█░█▀▀
#░▀▀▀░▀░▀░▀░▀░▀▀▀░▀▀▀░░░▀▀▀░▀░▀░░░░▀░░▀▀▀░░░▀░▀░▀▀▀░▀▀░░▀▀▀

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end
### END OF VI MODE ###

#░█▀█░█░█░▀█▀░█▀█░█▀▀░█▀█░█▄█░█▀█░█░░░█▀▀░▀█▀░█▀▀░░░█▀█░█▀█░█▀▄░░░█░█░▀█▀░█▀▀░█░█
#░█▀█░█░█░░█░░█░█░█░░░█░█░█░█░█▀▀░█░░░█▀▀░░█░░█▀▀░░░█▀█░█░█░█░█░░░█▀█░░█░░█░█░█▀█
#░▀░▀░▀▀▀░░▀░░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░░▀░░▀▀▀░░░▀░▀░▀░▀░▀▀░░░░▀░▀░▀▀▀░▀▀▀░▀░▀
#░█░░░▀█▀░█▀▀░█░█░▀█▀░░░█▀▀░█▀█░█░░░█▀█░█▀▄░█▀▀
#░█░░░░█░░█░█░█▀█░░█░░░░█░░░█░█░█░░░█░█░█▀▄░▀▀█
#░▀▀▀░▀▀▀░▀▀▀░▀░▀░░▀░░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀

set fish_color_normal brcyan
set fish_color_autosuggestion '#14123E'
set fish_color_command brblue
set fish_color_error '#ff6c6b'
set fish_color_param brmagenta

#░█▀▀░█▀█░█▀█░█▀▄░█░█
#░▀▀█░█▀▀░█▀█░█▀▄░█▀▄
#░▀▀▀░▀░░░▀░▀░▀░▀░▀░▀

set -g spark_version 1.0.0

complete -xc spark -n __fish_use_subcommand -a --help -d "Show usage help"
complete -xc spark -n __fish_use_subcommand -a --version -d "$spark_version"
complete -xc spark -n __fish_use_subcommand -a --min -d "Minimum range value"
complete -xc spark -n __fish_use_subcommand -a --max -d "Maximum range value"

function spark -d "sparkline generator"
    if isatty
        switch "$argv"
            case {,-}-v{ersion,}
                echo "spark version $spark_version"
            case {,-}-h{elp,}
                echo "usage: spark [--min=<n> --max=<n>] <numbers...>  Draw sparklines"
                echo "examples:"
                echo "       spark 1 2 3 4"
                echo "       seq 100 | sort -R | spark"
                echo "       awk \\\$0=length spark.fish | spark"
            case \*
                echo $argv | spark $argv
        end
        return
    end

    command awk -v FS="[[:space:],]*" -v argv="$argv" '
        BEGIN {
            min = match(argv, /--min=[0-9]+/) ? substr(argv, RSTART + 6, RLENGTH - 6) + 0 : ""
            max = match(argv, /--max=[0-9]+/) ? substr(argv, RSTART + 6, RLENGTH - 6) + 0 : ""
        }
        {
            for (i = j = 1; i <= NF; i++) {
                if ($i ~ /^--/) continue
                if ($i !~ /^-?[0-9]/) data[count + j++] = ""
                else {
                    v = data[count + j++] = int($i)
                    if (max == "" && min == "") max = min = v
                    if (max < v) max = v
                    if (min > v ) min = v
                }
            }
            count += j - 1
        }
        END {
            n = split(min == max && max ? "▅ ▅" : "▁ ▂ ▃ ▄ ▅ ▆ ▇ █", blocks, " ")
            scale = (scale = int(256 * (max - min) / (n - 1))) ? scale : 1
            for (i = 1; i <= count; i++)
                out = out (data[i] == "" ? " " : blocks[idx = int(256 * (data[i] - min) / scale) + 1])
            print out
        }
    '
end

# Spark functions
function letters
    cat $argv | awk -vFS='' '{for(i=1;i<=NF;i++){ if($i~/[a-zA-Z]/) { w[tolower($i)]++} } }END{for(i in w) print i,w[i]}' | sort | cut -c 3- | spark | lolcat
    printf  '%s\n' 'abcdefghijklmnopqrstuvwxyz'  ' ' | lolcat
end

function commits
    git log --author="$argv" --format=format:%ad --date=short | uniq -c | awk '{print $1}' | spark | lolcat
end

#░█▀▀░█░█░█▀█░█▀▀░▀█▀░▀█▀░█▀█░█▀█░█▀▀
#░█▀▀░█░█░█░█░█░░░░█░░░█░░█░█░█░█░▀▀█
#░▀░░░▀▀▀░▀░▀░▀▀▀░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀

### Navigation function
# usage: up <limit>
function up --argument limit
         if test \( -z "$limit" \) -o \( "$limit" -le 0 \)
            set limit 1
         end

         for i in (seq $limit)
            set d "../$d"
         end

         if test (cd "$d")
            echo "Couldn't go up $limit dirs.";
         end
end

### ARCHIVE EXTRACTION
# usage: ex <file>
function ex --argument file
         if test -f $file
            switch $file
                   case '*.tar.bz2'
                        tar xjf $file
                   case '*.tar.gz'
                        tar xzf $file
                   case '*.bz2'
                        bunzip2 $file
                   case '*.rar'
                        unrar x $file
                   case '*.gz'
                        gunzip $file
                   case '*.tar'
                        tar xf $file
                   case '*.tbz2'
                        tar xjf $file
                   case '*.tgz'
                        tar xzf $file
                   case '*.zip'
                        unzip $file
                   case '*.Z'
                        uncompress $file
                   case '*.7z'
                        7z x $file
                   case '*.deb'
                        ar x $file
                   case '*.tar.xz'
                        tar xf $file
                   case '*.tar.zst'
                        unzstd $file
                   case '*'
                        echo "'$file' cannot be extracted via ex()"
            end
         else
            echo "'$file' is not a valid file"
         end
end

### VIEW FILE
# usage: vw <file>
function vw --argument file
         if test -f $file
            switch $file
                   case '*.txt'
                        cat $file
                   case '*.pdf'
                        evice $file
                   case '*.mp4'
                        mpv $file
                   case '*.mkv'
                        vlc $file
                   case '*'
                        echo "'$file' cannot be viewed by vw()"
            end
         else
            echo "'$file' is not a valid file"
         end
end

# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

# The bindings for !! and !$
if [ $fish_key_bindings = "fish_vi_key_bindings" ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Function for creating a backup file
# ex: backup file.txt
# result: copies file as file.txt.bak
function backup --argument filename
    cp $filename $filename.bak
end

# Function for copying files and directories, even recursively.
# ex: copy DIRNAME LOCATIONS
# result: copies the directory and all of its contents.
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# Function for printing a column (splits input on whitespace)
# ex: echo 1 2 3 | coln 3
# output: 3
function coln
    while read -l input
        echo $input | awk '{print $'$argv[1]'}'
    end
end

# Function for printing a row
# ex: seq 3 | rown 3
# output: 3
function rown --argument index
    sed -n "$index p"
end

# Function for ignoring the first 'n' lines
# ex: seq 10 | skip 5
# results: prints everything but the first 5 lines
function skip --argument n
    tail +(math 1 + $n)
end

# Function for taking the first 'n' lines
# ex: seq 10 | take 5
# results: prints only the first 5 lines
function take --argument number
    head -$number
end

# Function for org-agenda
function org-search -d "send a search string to org-mode"
    set -l output (/usr/bin/emacsclient -a "" -e "(message \"%s\" (mapconcat #'substring-no-properties \
        (mapcar #'org-link-display-format \
        (org-ql-query \
        :select #'org-get-heading \
        :from  (org-agenda-files) \
        :where (org-ql--query-string-to-sexp \"$argv\"))) \
        \"
    \"))")
    printf $output
end

# Controls vsftpd service
function ftpd --argument stat -d "Controls vsftpd service"
         switch $stat
            case status
                 sudo systemctl status vsftpd
            case start
                 sudo systemctl start vsftpd
            case stop
                 sudo systemctl stop vsftpd
            case '*'
                 echo "Incorrect parameter!"
         end
end

###
### yt-dlp functions
###

# Download single video
function dlVideo --argument url --argument output -d "Download video"
         if test (count $argv) -lt 2 -o "$argv[1]" = "--help"
            printf "%b" "$EM_R\e0USAGE: dlVideo <URL> <OUTPUT_FILE>$COLOR_RESET"
            return 1
         end
         yt-dlp -f mp4 -i "$url" -o - | ffmpeg -f mp4 -i - "$output"
end

# Download playlist
function dlPlaylist --argument url --argument output -d "Download Playlist"
         if test (count $argv) -lt 2 -o "$argv[1]" = "--help"
            printf "%b" "$EM_R\e0USAGE: dlPlaylist <URL> <OUTPUT_FILE>$COLOR_RESET"
            return 1
         end
         yt-dlp -f mp4 --yes-playlist -i "$url" -o {$output}"_%(playlist_index)03d.%(ext)s"
end

# Download and cut video
function dlAndCutVideo --argument url --argument start --argument end --argument output -d "Download and cut video"
         if test (count $argv) -lt 4 -o "$argv[1]" = "--help"
            printf "%b" "$EM_R\e0USAGE: dwAndCutVid <URL> <START> <END> <OUTPUT_FILE>$COLOR_RESET"
            return 1
         end
         yt-dlp -f mp4 "$url" -o - | ffmpeg -f mp4 -i - -ss "$start" -to "$end" -c:v copy "$output"
end

# Download and resize to 640p
function dlVideo640p --argument url --argument output
         if test (count $argv) -lt 2 -o "$argv[1]" = "--help"
            printf "%b" "$EM_R\e0USAGE: dlVideo <URL> <OUTPUT_FILE>$COLOR_RESET"
            return 1
         end
         yt-dlp -f mp4 -i "$url" -o - | ffmpeg -f mp4 -i - -vf scale=640:480 "$output"
end

# Cut vídeo
function cutVideo --argument ipath --argument start --argument end --argument opath -d "Cut video file"
         if test (count $argv) -lt 4 -o "$argv[1]" = "--help"
            printf "%b" "$EM_R\e0USAGE: cutVideo <INPUT_FILE> <START> <END> <OUTPUT_FILE>$COLOR_RESET"
            return 1
         end
         ffmpeg -f mp4 -i "$ipath" -ss "$start" -to "$end" -c:v copy "$opath"
end

# Record screen
function recordScreen --argument path
         if test (count $argv) -lt 1
            printf "%b" "$EM_R\e0USAGE: recordScreen <PATH> $COLOR_RESET"
            return 1
         end
         set videosize (xdpyinfo | grep 'dimensions:' |  awk '{print $2}')
         notify-send "Record Screen" "The recording will start in 10 seconds"
         sleep 10s
         notify-send "Record Screen" "Recording..."
         ffmpeg -video_size $videosize -framerate 25 -f x11grab -i :0.0 -f pulse -ac 2 -i default $path
end

###
### Timer functions
###

# Countdown timer
function countdown --argument cnt -d "Countdown"
    set start (math (date '+%s') + $cnt)
    while test $start -ge (date +%s)
        set time (math $start - (date +%s))
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    end
end

# Stopwatch timer
function stopwatch -d "Stopwatch"
    set start (date +%s)
    while test true
        set time (math (date +%s) - $start)
        printf '%s\r' (date -u -d "@$time" +%H:%M:%S)
        sleep 0.1
    end
end

# Convert URL to Markdown file
function url2markdown --argument url --argument out -d "URL to Markdown"
    if test -z "$url"
        echo "Usage: url2markdown <url|path> [outfile.md]"
        echo ""
        echo "  Converts the specified URL (or path) to Markdown using Pandoc."
        echo ""
        echo "  If [outfile.md] (arg 2) is not specified..."
        echo ""
        echo "    - basename of url|path is used (arg 1)"
        echo "    - whitepsaces replaced with underscores"
        echo "    - control characters replaced with underscores"
        echo "    - convert to lowercase"
        echo "    - existing file extension replaced with .md"
        return 1
    end

    set -l outfile

    if test -z "$out"
        set outfile (basename "$url" | sed -E 's/[_[:blank:]]+/_/g' | sed -E 's/[_[:cntrl:]]+/_/g' | tr '[:upper:]' '[:lower:]')
        set outfile (echo $outfile | sed 's/\.[^.]*$//').md
    else
        set outfile "$out"
    end

    pandoc --standalone --from html "$url" --to markdown --output "$outfile"
end

###
### Nala functions
###

function apt
         command nala $argv
end

function sudo
         if test $argv[1] = "apt"
            command sudo nala $argv[2..(count $argv)]
         else
            command sudo $argv
         end
end

###
### Obsidian Vaults functions
###

# Today Note
function todaynote
         set VAULTTODAY ~/Dropbox/obsidian_vaults/principal/00\ -\ Daily\ Notes/
         set DATE (date '+%Y-%m-%d')
         glow $VAULTTODAY$DATE.md
end

#░█▀█░█░░░▀█▀░█▀█░█▀▀░█▀▀░█▀▀
#░█▀█░█░░░░█░░█▀█░▀▀█░█▀▀░▀▀█
#░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀

# \x1b[2J   <- clears tty
# \x1b[1;1H <- goes to (1, 1) (start)
alias clear='echo -en "\x1b[2J\x1b[1;1H" ; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo'

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Directories shortcuts
alias junk='z ~/_junkdrawer && ls'
alias docs='z ~/Documentos/docs && ls'
alias src='z ~/src && ls'
alias sql="z ~/src/sql && ls"
alias scripts='z ~/scripts && ls'
alias projs='z ~/Documentos/projects && ls'
alias configfish='z ~/.config/fish && ls'

# Disable and enable notebook internal keyboard
alias disablekb='xinput set-int-prop 15 "Device Enabled" 8 0'
alias enablekb='xinput set-int-prop 15 "Device Enabled" 8 1'

# vim and emacs
alias vim='nvim'
alias em='/usr/bin/emacs -nw'
alias emacs="emacsclient -c -a 'emacs'"
alias doomsync="~/.emacs.d/bin/doom sync"
alias doomdoctor="~/.emacs.d/bin/doom doctor"
alias doomupgrade="~/.emacs.d/bin/doom upgrade"
alias doompurge="~/.emacs.d/bin/doom purge"

# Changing "ls" do "exa"
alias ls='exa -lh --sort=mod -r --long --header --icons --color=always'
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l='exa --sort=mod -r --icons --color=always'
alias l.='exa -a | egrep "^\."'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grepfc='grep -rnw . -e '

# apt alias
alias aptup='sudo apt update && sudo apt upgrade'
alias aptupd='sudo apt update'
alias aptupg='sudo apt upgrade'
alias aptin='sudo apt install'
alias aptrm='sudo apt remove'

# Changing "cat" to "batcat"
alias cat='batcat'

# Network aliases
alias localip='ip a | grep \'inet 192\' | awk \'{ print $2 }\' | sed -e \'2d\''
alias publicip='curl ifconfig.me'
alias openports='sudo lsof -i -P -n | grep LISTEN'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# adding flags
alias df="df -h | sed -ne '1p' -e '/\/dev\/sd/p'"      # human-readable sizes
alias free='free -m'                                   # show sizes in MB

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# Merge Xresources
alias merge='xrdb -merge ~/.Xresources'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias tag='git tag'
alias newtag='git tag -a'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# Play audio files in current dir by type
alias playwav='deadbeef *.wav'
alias playogg='deadbeef *.ogg'
alias playmp3='deadbeef *.mp3'

# Play video files in current dir by type
alias playavi='vlc *.avi'
alias playmov='vlc *.mov'
alias playmp4='vlc *.mp4'

# yt-dlp
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-m4a="yt-dlp --extract-audio --audio-format m4a "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yta-opus="yt-dlp --extract-audio --audio-format opus "
alias yta-vorbis="yt-dlp --extract-audio --audio-format vorbis "
alias yta-wav="yt-dlp --extract-audio --audio-format wav "
alias ytv-best="yt-dlp -f bestvideo+bestaudio "

# switch between shells
# I do not recommend switching default SHELL from bash.
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

# bare git repo alias for dotfiles
alias config="/usr/bin/git --git-dir='$HOME/src/my-dotfiles/.git' --work-tree=$HOME"

# termbin
alias tb="nc termbin.com 9999"

# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# the terminal bad apple
alias badapple='CACA_DRIVER=ncurses mpv -vo=caca https://youtu.be/9lNZ_Rnr7Jc 2>/dev/null'

# Unlock LBRY tips
alias tips="lbrynet txo spend --type=support --is_not_my_input --blocking"

# Loop command
alias loop="loop-rs"

# Visidata
alias vd="vd --csv-delimiter"

# Clima
alias clima="curl 'wttr.in/Fortaleza?m2&lang=pt-br'"

# PrettyPing
alias ping='prettyping'

# ScreenFetch
alias screenfetch='command screenfetch 2>/dev/null $argv;'

# Cointop
alias cointop='TERM=xterm-256color command cointop'

# NCCM
alias nccm='TERM=xterm-256color command nccm'

# Kitty Kittens
alias icat='kitty +kitten icat --place 1x1@95x0'

# TODO.TXT
alias t='todo.sh'

#░▀█▀░█▀▀░█▀▄░█▄█░▀█▀░█▀█░█▀█░█░░░░░█▀█░█▀▄░█▀█░█▄█░█▀█░▀█▀
#░░█░░█▀▀░█▀▄░█░█░░█░░█░█░█▀█░█░░░░░█▀▀░█▀▄░█░█░█░█░█▀▀░░█░
#░░▀░░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀▀░░░▀░░░▀░▀░▀▀▀░▀░▀░▀░░░░▀░

#starship init fish | source
# Powerline
function fish_prompt
  powerline-shell --shell bare $status
end

#░█▀▀░█▀█░█░░░█▀█░█▀▄░░░█▀█░█▀█░█░░░█░░░█▀▀░▀█▀░░░█▀▄░█░█░░░█░█░█▀█
#░█░░░█░█░█░░░█░█░█▀▄░░░█▀▀░█▀█░█░░░█░░░█▀▀░░█░░░░█▀▄░░█░░░░█▄█░█▀▀
#░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░░░▀░░░▀░▀░▀▀▀░▀▀▀░▀▀▀░░▀░░░░▀▀░░░▀░░░░▀░▀░▀░░

#setxkbmap -layout br,apl,br -variant abnt2,dyalog -option grp:switch
wal -i ~/.config/bspwm/wallpaper.png -q

#░▀█▀░█▀█░█▀▀░▀█▀░█▀█░█░░░█░░░░░▀▀█░█▀█░█░█░▀█▀░█▀▄░█▀▀
#░░█░░█░█░▀▀█░░█░░█▀█░█░░░█░░░░░▄▀░░█░█░▄▀▄░░█░░█░█░█▀▀
#░▀▀▀░▀░▀░▀▀▀░░▀░░▀░▀░▀▀▀░▀▀▀░░░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀░░▀▀▀

zoxide init fish | source

#░█▀▀░▀▀█░█▀▀░░░█░█░█▀▀░█░█░░░█▀▄░▀█▀░█▀█░█▀▄░▀█▀░█▀█░█▀▀
#░█▀▀░▄▀░░█▀▀░░░█▀▄░█▀▀░░█░░░░█▀▄░░█░░█░█░█░█░░█░░█░█░█░█
#░▀░░░▀▀▀░▀░░░░░▀░▀░▀▀▀░░▀░░░░▀▀░░▀▀▀░▀░▀░▀▀░░▀▀▀░▀░▀░▀▀▀

fzf_key_bindings

#░█▀█░▀█▀░█░█░░░█▀█░█▀█░█▀▀░█░█░█▀█░█▀▀░█▀▀░░░█▄█░█▀█░█▀█░█▀█░█▀▀░█▀▀░█▀▄
#░█░█░░█░░▄▀▄░░░█▀▀░█▀█░█░░░█▀▄░█▀█░█░█░█▀▀░░░█░█░█▀█░█░█░█▀█░█░█░█▀▀░█▀▄
#░▀░▀░▀▀▀░▀░▀░░░▀░░░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀▀▀░░░▀░▀░▀░▀░▀░▀░▀░▀░▀▀▀░▀▀▀░▀░▀

source ~/.config/fish/conf.d/nix-env.fish

cd $HOME
