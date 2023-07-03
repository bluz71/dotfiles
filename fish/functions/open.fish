function open --description 'Open command override'
    if test $OS = Linux
        command xdg-open 2>/dev/null $argv
    else if test $OS = Darwin
        command open $argv
    end
end
