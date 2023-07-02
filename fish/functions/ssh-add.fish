function ssh-add --description 'ssh-add override'
    if test $OS = Linux
        command /usr/bin/ssh-add $argv
    else if test $OS = Darwin
        command /opt/homebrew/bin/ssh-add $argv
    end
end
