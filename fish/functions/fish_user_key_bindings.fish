function fish_user_key_bindings
    # Bindings, invoke 'bind' for full listing:
    #
    # - Alt-Left: navigate back in directory history
    # - Alt-Right: navigate forward in directory history
    # - Ctrl-Left / Alt-b: move backward a word
    # - Ctrl-Right / Alt-f: move forward a word
    # - Shift-Left: move forward a BIG word
    # - Shift-Right: move backward a BIG word
    # - Alt-d: delete forward word
    # - Alt-<backspace>: delete backward word
    # - Alt-u: undo last edit
    # - Alt-e: edit the current command in $EDITOR and execute
    # - Alt-.: append last parameter from previous command
    # - Ctrl-a/HOME/fn-left: go to start of line
    # - Ctrl-e/END/fn-right: go to end of line
    # - Ctrl-r: reverse history search
    # - Ctrl-u: change up a directory
    # - Ctrl-p: append pager
    # - Alt-s: prepend 'sudo'
    # - Ctrl-s: toggle completion search

    # Need to define Shift-Left & Shift-Right as follows for BIG word navigation
    # to work in tmux inside Alacritty.
    bind \e\[1\;2D backward-bigword
    bind \e\[1\;2C forward-bigword
    # Rebind 'undo' to Alt-u.
    bind \eu undo
    # Rebind 'pager' to Ctrl-p.
    bind \cp __fish_paginate

    # Require consecutive 'Ctrl-d's to exit.
    bind \cd delete-char
    bind \cd\cd delete-or-exit

    if test -n "$HOMEBREW_PREFIX"
        # Enable 'fzf' key bindings.
        fzf_key_bindings
    end
end
