function lls --description 'List files sorted by size'
    ll -r --sort=size $argv | less
end
