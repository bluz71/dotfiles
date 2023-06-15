function lldt
    ll -r --sort=modified --list-dirs $argv | less
end
