function scp --description 'scp override'
    if test $OS = Linux
        command /usr/bin/scp -r $argv
    else if test $OS = Darwin
        command /opt/homebrew/bin/scp -r $argv
    end
end
