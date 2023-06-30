function tnew --description 'Create a new tmux session'
    tmux new -s (basename $(pwd) | cut -d'.' -f1)
end
