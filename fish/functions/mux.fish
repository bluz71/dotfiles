function mux --wraps tmuxinator --description 'tmuxinator wrapper'
    if test (count $argv) -eq 1; and test $argv[1] = stop
        # First stop any running containers.
        docker container stop (docker container ls --quiet) >/dev/null 2>&1
        # Now stop the current session.
        tmuxinator stop (tmux display-message -p '#S')
    else
        tmuxinator $argv
    end
end
