function cpa --description 'Archival copy'
    if test $OS = Linux
        command /bin/cp -i -dR --preserve=ownership,timestamps $argv
    else if test $OS = Darwin
        command /opt/homebrew/bin/gcp -i -a $argv
    end
end
