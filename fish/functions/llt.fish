function llt --description 'List files sorted by date'
    ll -r --sort=modified $argv | less
end
