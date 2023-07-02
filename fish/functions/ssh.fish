function ssh --description 'ssh override'
    if test $OS = Linux
        command /usr/bin/ssh $argv
    else if test $OS = Darwin
        command /opt/homebrew/bin/ssh $argv
    end
end
