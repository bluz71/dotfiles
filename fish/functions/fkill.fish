function fkill --description 'fzf process kill'
    if test $OS = Linux
        set -f pids (ps -f -u $USER | sed 1d | fzf | awk '{print $2}')
    else if test $OS = Darwin
        set -f pids (ps -f -u $USER | sed 1d | fzf | awk '{print $3}')
    else
        echo 'Error: unknown platform.'
        return
    end
    echo $pids
    if test -n "$pids"
        echo "$pids" | xargs kill -9 $argv
    end
end
