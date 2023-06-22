# https://github.com/junegunn/fzf/wiki/Examples-(fish)#completion
#
function fzf_complete
    set -l cmd (commandline -co) (commandline -ct)
    switch $cmd[1]
        case env sudo
            for i in (seq 2 (count $cmd))
                switch $cmd[$i]
                    case '-*'
                    case '*=*'
                    case '*'
                        set cmd $cmd[$i..-1]
                        break
                end
            end
    end
    set cmd (string join -- ' ' $cmd)

    set -l complist (complete -C$cmd)
    set -l result
    string join -- \n $complist | sort | \
      eval (__fzfcmd) -m --select-1 --exit-0 --height 60% --info=hidden --header '(commandline)' | \
        cut -f1 | \
          while read -l r
            set result $result $r
          end

    set prefix (string sub -s 1 -l 1 -- (commandline -t))
    for i in (seq (count $result))
        set -l r $result[$i]
        switch $prefix
            case "'"
                commandline -t -- (string escape -- $r)
            case '"'
                if string match '*"*' -- $r >/dev/null
                    commandline -t -- (string escape -- $r)
                else
                    commandline -t -- '"'$r'"'
                end
            case '~'
                commandline -t -- (string sub -s 2 (string escape -n -- $r))
            case '*'
                commandline -t -- (string escape -n -- $r)
        end
        [ $i -lt (count $result) ]; and commandline -i ' '
    end

    commandline -f repaint
end
