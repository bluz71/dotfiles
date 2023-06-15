function mux --wraps tmuxinator
    if test (count $argv) -eq 1 && $argv[1] = stop
        # Automatically stop the current session.
        tmuxinator stop (tmux display-message -p '#S')
    else
        tmuxinator $argv
    end
end
