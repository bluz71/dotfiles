function lldt --description 'List directories sorted by date'
    ll -r --sort=modified --list-dirs $argv | less
end
