function cwd --description 'Copy working directory'
    if test $OS = Linux
        echo -n (echo $PWD | sed "s|^$HOME|~|") | tr -d "\r\n" | xclip -selection clipboard -i
    else if test $OS = Darwin
        echo -n (echo $PWD | sed "s|^$HOME|~|") | tr -d "\r\n" | pbcopy
    end
    # Also copy current directory to a tmux paste buffer if tmux is active.
    if test -n "$TMUX"
        echo -n (echo $PWD | sed "s|^$HOME|~|") | tr -d "\r\n" | tmux load-buffer -
    end
end
