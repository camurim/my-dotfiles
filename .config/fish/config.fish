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
         set VAULTTODAY ~/Dropbox/obsidian_vaults/principal/00\ -\ Daily\ Notes/
         set DATE (date '+%Y-%m-%d')
         glow $VAULTTODAY$DATE.md
end

# Quicknote
function quicknote
         vim /home/carlos/Dropbox/obsidian_vaults/principal/03\ -\ Others/Quicknote.md
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
        AQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADk
        CRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAA
        QJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEA
        AADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegFxVkCsAAAvjSURBVAEAAADkCRgA
        AABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6A
        AQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADk
        CRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAA
        QJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEA
        AADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkY
        AAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECe
        gAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA
        5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAA
        AECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoAB
        AAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJ
        GAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABA
        noABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAA
        AOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgA
        AABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6A
        AQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADk
        CRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAA
        QJ6AAQAAAOQJGAAAAECegAEAAADkbR70AAAARcuyfOX9arXap0kAgBkBAwDgIf+JF+s59uyzMzPz
        yfXr88z29syyzMcfX537i6xCBgDsDwEDAGBPy5x95dycPvPC3Lxxc176wUuzs7MzR48enb/8+e15
        4+IbBz0gADxRvAMDAGAPyzKzsbkxV/51Zf705pvzkx/9eN5+66356MOPZmtr678+YgIAfLsEDACA
        R7hw/vz88Q+/n5/+/Gdz5Mgzc/bcK/O73/5mfvXaawc9GgA8cQQMAIA9rFYz6/UyOzvvzLVrV2dm
        5sMrV+bSO5dmWe7eAwD7xzswAAD2dLdQfPElncuy3Pt99fk9ALA/bGAAADzgfrS4++PBULH6wr2I
        AQD7RcAAAHgkgQIAKgQMAICvwdIFABwMAQMAAADIEzAAAACAPAEDAAAAyBMwAAAAgDwBAwDga1iW
        g54AAJ5MAgYAwCOpFQBQIWAAADxgubdmsSzLnDlzera3j87MzMmTz83p50/Nsqy/9HcAwOO3edAD
        AAA0LfPyD8/O8ePPzS8vXJgbNz6d1y9enJfPnptL7/x13rj4+sysDnpIAHhi2MAAANjDssxsbW3N
        J59cn1OnTs0vXn11jh8/PtevfzpbW1vehQEA+8wGBgDAI1w4f35e/P6LM7Oai79+bZ4/8/ys18v8
        /f33x/YFAOwvAQMAYA+r1cx6vczf3n3v87OrV6/du1vNaiVgAMB+EjAAAPa0uhcqli89LnK3W4gX
        ALDfBAwAgAfc3664+y0jq9lr2cIGBgDsLwEDAOARRAoA6PAtJAAAAECegAEAAADkCRgAAABAnoAB
        AAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJ
        GAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABA
        noABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAA
        AOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgA
        AABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6A
        AQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADk
        CRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAA
        QJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEA
        AADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkY
        AAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECe
        gAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA
        5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAA
        AECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoAB
        AAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJ
        GAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABA
        noABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAA
        AOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgA
        AABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6A
        AQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADk
        CRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAA
        QJ6AAQAAAOQJGAAAAECegAEAAADkCRgAAABAnoABAAAA5AkYAAAAQJ6AAQAAAOQJGAAAAECegAEA
        AADkCRgAAADAY3X71q2Hzm7dfPjsqwgYAAAAwGP1jw8uP3T2wT8fPvsqm9/WMAAAAAB7uXTpvZmZ
        eeF7Z2bmbry4f/a/EjAAAACAx2q9Xs/Ozruzs/PuN/4Mj5AAAAAAeQIGAAAAkCdgAAAAAHkCBgAA
        AJAnYAAAAAB5h1ar1SzLctBzAAAAADxkWZbZ2Dg0m5ub35llWc9qtTEzM7u7uwc8GgAAAPD/5PLl
        K4/ts5dlPYefPjKHto9uz+7uZ4/tHwEAAAB8U7u7n82JE9+dQzdu3J7Dhw/PnTu3Zr3e9TgJAAAA
        cKCWZZn1enfu3Lk1J587OUeePjKb29tHZuPQodldVrNadufOnduzXosYAAAAwMHY2NiYraeemtMn
        Ts2xY8dmWS/zb59h09lg/rYMAAAAAElFTkSuQmCC" | tr -d ' ' | base64 -d > /tmp/baseimage.png

         convert -font "Code-New-Roman-Bold-Nerd-Font-Complete-Mono" -pointsize 20 -fill green -draw "text 10,205  \"$input\"" /tmp/baseimage.png $output

         command rm -f /tmp/baseimage.png
end

# Get Key Codes
function getkeycode
         xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
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
