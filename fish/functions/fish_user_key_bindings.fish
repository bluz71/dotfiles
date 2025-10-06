function fish_user_key_bindings
    # Bindings, invoke 'bind' for full listing:
    #
    # - Alt-Left: navigate back in directory history (if command empty)
    # - Alt-Right: navigate forward in directory history (if command empty)
    # - Alt-Left: move backward a word (if command populated)
    # - Alt-Right: move forward a word (if command populated)
    # - Ctrl-Left: move forward a BIG word
    # - Ctrl-Right: move backward a BIG word
    # - Alt-d: delete forward word
    # - Alt-<backspace>: delete backward word
    # - Ctrl-u: kill line
    # - Alt-u: undo last edit
    # - Alt-e: edit the current command in $EDITOR and execute
    # - Alt-.: append last parameter from previous command
    # - Ctrl-a/HOME/fn-left: go to start of line
    # - Ctrl-e/END/fn-right: go to end of line
    # - Ctrl-r: reverse history search
    # - Ctrl-p: append pager
    # - Alt-s: prepend 'sudo'
    # - Ctrl-s: toggle completion search
    # - Ctrl-Alt-w: whatis current token

    # Override Fish 4.X bindings. Preference alt bindings to operate on words
    # whilst ctrl bindings should work on BIG words (aka tokens).
    bind alt-left prevd-or-backward-word
    bind ctrl-left backward-token
    bind alt-right nextd-or-forward-word
    bind ctrl-right forward-token
    bind alt-backspace backward-kill-word
    bind ctrl-backspace backward-kill-token

    # Need to define Shift-Left & Shift-Right as follows for BIG word navigation
    # to work in tmux inside Alacritty.
    bind \e\[1\;2D backward-bigword
    bind \e\[1\;2C forward-bigword
    # Rebind 'undo' to Alt-u.
    bind \eu undo
    # Rebind 'pager' to Ctrl-p.
    bind \cp __fish_paginate
    # Rebind 'whatis' to Ctrl-Alt-w.
    bind \e\cw __fish_whatis_current_token

    # Require consecutive 'Ctrl-d's to exit.
    bind \cd delete-char
    bind \cd\cd delete-or-exit

    # Unbind unwanted default bindings.
    bind \el ''
    bind \eo ''
    bind \cw ''
    bind \eh ''

    if test -n "$HOMEBREW_PREFIX"
        # Enable 'fzf' key bindings.
        fzf_key_bindings
    end
end
