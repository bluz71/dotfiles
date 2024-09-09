function glob --description 'Use find to mimic Bash path expansions'
    find . -maxdepth 1 -iname $argv
end
