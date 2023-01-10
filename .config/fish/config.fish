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

#░█▀▀░█▀▄░█▀▀░█▀▀░▀█▀░▀█▀░█▀█░█▀▀
#░█░█░█▀▄░█▀▀░█▀▀░░█░░░█░░█░█░█░█
#░▀▀▀░▀░▀░▀▀▀░▀▀▀░░▀░░▀▀▀░▀░▀░▀▀▀

function fish_greeting
        set termcnt (pgrep -c (basename (readlink -f (which x-terminal-emulator))))
        if test $termcnt -lt 3
            neofetch
        else
            set cols (tput cols)
            if test $cols -lt 100
               pfetch
            else
               colorscript random
            end
        end
end

#░█▀█░█▀█░▀█▀░█░█
#░█▀▀░█▀█░░█░░█▀█
#░▀░░░▀░▀░░▀░░▀░▀

### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/.cargo/bin $HOME/opt/eclipse/jee-2021-09/eclipse $HOME/.emacs.d/bin $HOME/.wakatime $HOME/.local/share/coursier/bin $HOME/opt/apache-maven-3.8.6/bin
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

#░█▀▀░█░█░█▀█░█▀█░█▀▄░▀█▀
#░█▀▀░▄▀▄░█▀▀░█░█░█▀▄░░█░
#░▀▀▀░▀░▀░▀░░░▀▀▀░▀░▀░░▀░

## TODO.txt configuration
set -x TODO_DIR /home/carlos/google-drive/todo
set -x TODO_FILE $TODO_DIR/todo.txt
set -x DONE_FILE $TODO_DIR/done.txt
set -x TODO_ACTIONS_DIR /home/carlos/.todo.actions.d

#set fish_greeting                                 # Supresses fish's intro message
set -x TERM "xterm-256color"                         # Sets the terminal type
set -x EDITOR "emacsclient -t -a ''"                 # $EDITOR use Emacs in terminal
set -x VISUAL "emacsclient -c -a emacs"              # $VISUAL use Emacs in GUI mode

### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### "vim" as manpager
# set -x MANPAGER '/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
# set -x MANPAGER "nvim -c 'set ft=man' -"

## Java Variables
set -x JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/

#░█▀▀░█▄█░█▀█░█▀▀░█▀▀░░░█▀█░█▀▄░░░█░█░▀█▀░░░█▄█░█▀█░█▀▄░█▀▀
#░█▀▀░█░█░█▀█░█░░░▀▀█░░░█░█░█▀▄░░░▀▄▀░░█░░░░█░█░█░█░█░█░█▀▀
#░▀▀▀░▀░▀░▀░▀░▀▀▀░▀▀▀░░░▀▀▀░▀░▀░░░░▀░░▀▀▀░░░▀░▀░▀▀▀░▀▀░░▀▀▀

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end

## Disable VI Inser/Delete Mode Indicator
function fish_mode_prompt

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
                   case '*.tbz'
                        tar xjf $file
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
                   case '*.json'
                        cat $file
                   case '*.js'
                        cat $file
                   case '*.java'
                        cat $file
                   case '*.c'
                        cat $file
                   case '*.cpp'
                        cat $file
                   case '*.scala'
                        cat $file
                   case '*.pdf'
                        evince $file &
                   case '*.md'
                        glow $file
                   case '*.csv'
                        command vd --csv-delimiter=';' $file
                   case '*.CSV'
                        command vd --csv-delimiter=',' $file
                   case '*.odt'
                        odt2txt $file | bat -
                   case '*.ods'
                        libreoffice --infilter="Text(encoded):44,34,76" --convert-to _new.csv $file --outdir /tmp/ && command vd --csv-delimiter=',' /tmp/(echo $file | sed 's/\.[^.]*$//')._new.csv
                   case '*.xls'
                        libreoffice --infilter="Text(encoded):44,34,76" --convert-to _new.csv $file --outdir /tmp/ && command vd --csv-delimiter=',' /tmp/(echo $file | sed 's/\.[^.]*$//')._new.csv
                   case '*.png'
                        feh $file &
                   case '*.jpg'
                        feh $file &
                   case '*.gif'
                        feh $file &
                   case '*.xlsx'
                        libreoffice --infilter="Text(encoded):44,34,76" --convert-to _new.csv $file --outdir /tmp/ && command vd --csv-delimiter=',' /tmp/(echo $file | sed 's/\.[^.]*$//')._new.csv
                   case '*.mp4'
                        mpv $file &
                   case '*.mkv'
                        vlc $file &
                   case '*.mp3'
                        deadbeef $file &
                   case '*.flac'
                        deadbeef $file &
                   case '*'
                        xdg-open $file &
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

# Controls grive service
function grived --argument stat -d "Controls grive service"
         switch $stat
            case status
                 systemctl --user status grive@(systemd-escape /home/carlos/google-drive).service
            case start
                 systemctl --user start grive@(systemd-escape /home/carlos/google-drive).service
            case stop
                 systemctl --user stop grive@(systemd-escape /home/carlos/google-drive).service
            case restart
                 systemctl --user restart grive@(systemd-escape /home/carlos/google-drive).service
            case log
                 tail -n 5000 /var/log/syslog | grep 'grive'
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
function dlVideo360p --argument url --argument output
         if test (count $argv) -lt 2 -o "$argv[1]" = "--help"
            printf "%b" "$EM_R\e0USAGE: dlVideo360p <URL> <OUTPUT_FILE>$COLOR_RESET"
            return 1
         end
         yt-dlp -f mp4 -i "$url" -o - | ffmpeg -f mp4 -i - -vf scale=640:480 "$output"
end

function dlVideo240p --argument url --argument output
         if test (count $argv) -lt 2 -o "$argv[1]" = "--help"
            printf "%b" "$EM_R\e0USAGE: dlVideo240p <URL> <OUTPUT_FILE>$COLOR_RESET"
            return 1
         end
         yt-dlp -f mp4 -i "$url" -o - | ffmpeg -f mp4 -i - -vf scale=426:240 "$output"
end

###
### ffmpeg functions
###

# Cut vídeo
function cutVideo --argument ipath --argument start --argument end --argument opath -d "Cut video file"
         if test (count $argv) -lt 4 -o "$argv[1]" = "--help"
            printf "%b" "$EM_R\e0USAGE: cutVideo <INPUT_FILE> <START> <END> <OUTPUT_FILE>$COLOR_RESET"
            return 1
         end
         ffmpeg -f mp4 -i "$ipath" -ss "$start" -to "$end" -c:v copy "$opath"
end

# Resize videos to 360p
function resizeVideo360p --argument input --argument output
         if test (count $argv) -eq 1
            if test "$argv[1]" = "--help"
               printf "%b" "$EM_R\e0USAGE: resizeVideo360p <INPUT_FILE> <OUTPUT_FILE>$COLOR_RESET"
               return 1
            else
                if test ! -e $input
                   printf "%b" "$EM_R\e0FILE $input DOES NOT EXISTS$COLOR_REST"
                   return 1
                end

                set output (basename $input)
                set output (echo $output | sed 's/\.[^.]*$//')
                set output {$output}_360p.mp4
            end
         else if test (count $argv) -lt 1
            printf "%b" "$EM_R\e0USAGE: resizeVideo360p <INPUT_FILE> <OUTPUT_FILE>$COLOR_RESET"
            return 1
         else if test (count $argv) -gt 1
            if test ! -e $input
                printf "%b" "$EM_R\e0FILE $input DOES NOT EXISTS$COLOR_REST"
                return 1
            end
         end

         ffmpeg -f mp4 -i "$input" -vf scale=640:480 "$output"
end

# Resize videos to 240p
function resizeVideo240p --argument input --argument output
         if test (count $argv) -eq 1
            if test "$argv[1]" = "--help"
               printf "%b" "$EM_R\e0USAGE: resizeVideo240p <INPUT_FILE> <OUTPUT_FILE>$COLOR_RESET"
               return 1
            else
                if test ! -e $input
                   printf "%b" "$EM_R\e0FILE $input DOES NOT EXISTS$COLOR_REST"
                   return 1
                end

                set output (basename $input)
                set output (echo $output | sed 's/\.[^.]*$//')
                set output {$output}_240p.mp4
            end
         else if test (count $argv) -lt 1
            printf "%b" "$EM_R\e0USAGE: resizeVideo240p <INPUT_FILE> <OUTPUT_FILE>$COLOR_RESET"
            return 1
         else if test (count $argv) -gt 1
            if test ! -e $input
                printf "%b" "$EM_R\e0FILE $input DOES NOT EXISTS$COLOR_REST"
                return 1
            end
         end

         ffmpeg -f mp4 -i "$input" -vf scale=426:240 "$output"
end

# Record screen
function recordScreen --argument path
         if test (count $argv) -lt 1
            printf "%b" "$EM_R\e0USAGE: recordScreen <PATH> $COLOR_RESET"
            return 1
         end

         set videosize (xdpyinfo | grep 'dimensions:' |  awk '{print $2}')

         set name "Timeout"
         set thetime 10
         set increasefactor (math $thetime / 100)
         set unit "s"

         begin
            set counter 0
            while test $counter -le 100
                  echo $counter
                  sleep {$increasefactor}{$unit}
                  set counter (math $counter + 1)
            end
         end | zenity --progress --title="$name" --text="The recording will start in 10 seconds" --percentage=0 --auto-close

         if test $status -eq 0
            #ffmpeg -video_size $videosize -framerate 25 -f x11grab -i :0.0 -f pulse -ac 2 -i default $path
            ffmpeg -video_size $videosize -framerate 25 -f x11grab -i :0.0 \
            -f pulse -thread_queue_size 512k -i alsa_input.pci-0000_00_1f.3.analog-stereo \
            -f pulse -thread_queue_size 512k -i alsa_output.pci-0000_00_1f.3.analog-stereo.monitor \
            -filter_complex "[1]volume=+30dB;[1:a:0][2:a:0]amix=2[aout]" -map 0:V:0 -map "[aout]" $path
         end
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
         set VAULTTODAY ~/google-drive/obsidian_vaults/principal/00\ -\ Daily\ Notes/
         set DATE (date '+%Y-%m-%d')
         glow $VAULTTODAY$DATE.md
end

# Quicknote
function quicknote
         vim /home/carlos/google-drive/obsidian_vaults/principal/03\ -\ Others/Quicknote.md
end

# Cheat Sheet function
function cheat --argument cmd
         curl "https://cheat.sh/{$cmd}"
end

# Generate image with text
function text2Image --argument input --argument output
         if test (count $argv) -lt 2
            printf "%b" "$EM_R\e0USAGE: text2Image <TEXT> <OUTPUT_IMAGE> $COLOR_RESET"
            return 1
         end

        echo "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
        pUBNg4cVGo6v/w9/5EBSREwAAA==" | tr -d ' ' | base64 -d | gunzip -c > /tmp/baseimage.png

        convert -font "Code-New-Roman-Bold-Nerd-Font-Complete-Mono" -pointsize 20 -fill green -draw "text 10,205  \"$input\"" /tmp/baseimage.png $output

        command rm -f /tmp/baseimage.png
end

# Get Key Codes
function getkeycode
         xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
end

# Changes the modification date to the current date
function now --argument file
         set DATE (date '+%Y%m%d%H%M')
         touch -t $DATE $file
end

# Changes the modification date to yesterday
function yesterday --argument file
         set DATE (date '+%Y%m%d%H%M' -d 'yesterday')
         touch -t $DATE $file
end

#░█▀█░█░░░▀█▀░█▀█░█▀▀░█▀▀░█▀▀
#░█▀█░█░░░░█░░█▀█░▀▀█░█▀▀░▀▀█
#░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀

# Reload Fish Shell configurations
alias reloadfish='source ~/.config/fish/config.fish'

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
alias e='nvim'
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
alias i='sudo apt install'
alias aptup='sudo apt update && sudo apt upgrade'
alias aptupd='sudo apt update'
alias aptupg='sudo apt upgrade'
alias aptin='sudo apt install'
alias aptrm='sudo apt remove'

# Changing "cat" to "bat"
alias cat='bat'

# Network aliases
alias localip='ip a | grep \'inet 192\' | awk \'{ print $2 }\' | sed -e \'2d\''
alias publicip='curl ifconfig.me'
alias openports='sudo lsof -i -P -n | grep LISTEN'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rmf='rm -i'

# Trash instead of rm
alias rm="trash"

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
alias badapple='CACA_DRIVER=ncurses mpv --profile=low-latency -vo=caca https://youtu.be/9lNZ_Rnr7Jc 2>/dev/null'

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

# View WebCam stream
alias webcam='mpv /dev/video1'

# Twitter CLI client
alias tw='rainbowstream'

# Copy current path to clipboard
alias copycurrpath='pwd | xclip -selection clipboard && notify-send "Clipboard" "Current path copied to clipboard!"'

# YouTube Music TUI client
alias ytmusic="ytui_music run"

# Alias to pgcli
alias pg='pgcli'
alias pgcmic='pgcli -h ARES -p 5432 -U postgres -d cmic'
alias pgcadbolsa='pgcli -h ARES -p 5433 -U postgres -d cadbolsa'

# Current Screen Resolution
alias res="xdpyinfo | awk '/dimensions/{print $2}'"

#░▀█▀░█▀▀░█▀▄░█▄█░▀█▀░█▀█░█▀█░█░░░░░█▀█░█▀▄░█▀█░█▄█░█▀█░▀█▀
#░░█░░█▀▀░█▀▄░█░█░░█░░█░█░█▀█░█░░░░░█▀▀░█▀▄░█░█░█░█░█▀▀░░█░
#░░▀░░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀▀░░░▀░░░▀░▀░▀▀▀░▀░▀░▀░░░░▀░

# Oh My Fish! Agnoster Theme
set -g fish_git_prompt_untracked_files yes

#starship init fish | source
# Powerline
#function fish_prompt
  #powerline-shell --shell bare $status
#end

#░█▀▀░█▀█░█░░░█▀█░█▀▄░░░█▀█░█▀█░█░░░█░░░█▀▀░▀█▀░░░█▀▄░█░█░░░█░█░█▀█
#░█░░░█░█░█░░░█░█░█▀▄░░░█▀▀░█▀█░█░░░█░░░█▀▀░░█░░░░█▀▄░░█░░░░█▄█░█▀▀
#░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░░░▀░░░▀░▀░▀▀▀░▀▀▀░▀▀▀░░▀░░░░▀▀░░░▀░░░░▀░▀░▀░░

#setxkbmap -layout br,apl,br -variant abnt2,dyalog -option grp:switch
wal -i ~/.config/bspwm/wallpaper.png -q

#░▀█▀░█▀█░█▀▀░▀█▀░█▀█░█░░░█░░░░░▀▀█░█▀█░█░█░▀█▀░█▀▄░█▀▀
#░░█░░█░█░▀▀█░░█░░█▀█░█░░░█░░░░░▄▀░░█░█░▄▀▄░░█░░█░█░█▀▀
#░▀▀▀░▀░▀░▀▀▀░░▀░░▀░▀░▀▀▀░▀▀▀░░░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀░░▀▀▀

zoxide init fish | source

#░█▀█░█░█░▀█▀░█▀█░░░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀░█░█░█▀▄░█▀█░▀█▀░▀█▀░█▀█░█▀█
#░█▀█░█░█░░█░░█░█░░░█░░░█░█░█░█░█▀▀░░█░░█░█░█░█░█▀▄░█▀█░░█░░░█░░█░█░█░█
#░▀░▀░▀▀▀░▀▀▀░▀░▀░░░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀░▀

set -gx ATUIN_NOBIND "true"

atuin init fish | source

bind \cf _atuin_search
bind -k up _atuin_bind_up
bind \eOA _atuin_bind_up
bind \e\[A _atuin_bind_up

if bind -M insert > /dev/null 2>&1
    bind -M insert \cf _atuin_search
    bind -M insert -k up _atuin_bind_up
    bind -M insert \eOA _atuin_bind_up
    bind -M insert \e\[A _atuin_bind_up
end

#░█▀▀░▀▀█░█▀▀░░░█░█░█▀▀░█░█░░░█▀▄░▀█▀░█▀█░█▀▄░▀█▀░█▀█░█▀▀
#░█▀▀░▄▀░░█▀▀░░░█▀▄░█▀▀░░█░░░░█▀▄░░█░░█░█░█░█░░█░░█░█░█░█
#░▀░░░▀▀▀░▀░░░░░▀░▀░▀▀▀░░▀░░░░▀▀░░▀▀▀░▀░▀░▀▀░░▀▀▀░▀░▀░▀▀▀

fzf_key_bindings

#░█▀█░▀█▀░█░█░░░█▀█░█▀█░█▀▀░█░█░█▀█░█▀▀░█▀▀░░░█▄█░█▀█░█▀█░█▀█░█▀▀░█▀▀░█▀▄
#░█░█░░█░░▄▀▄░░░█▀▀░█▀█░█░░░█▀▄░█▀█░█░█░█▀▀░░░█░█░█▀█░█░█░█▀█░█░█░█▀▀░█▀▄
#░▀░▀░▀▀▀░▀░▀░░░▀░░░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀▀▀░░░▀░▀░▀░▀░▀░▀░▀░▀░▀▀▀░▀▀▀░▀░▀

source ~/.config/fish/conf.d/nix-env.fish

cd $HOME
