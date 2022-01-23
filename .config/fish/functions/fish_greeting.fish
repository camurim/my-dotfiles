function fish_greeting
        set termcnt (pgrep -c (basename (readlink -f (which x-terminal-emulator))))
        if test $termcnt -lt 3
            neofetch
        else
            colorscript random
        end
end
