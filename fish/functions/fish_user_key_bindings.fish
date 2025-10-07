function fish_user_key_bindings
    # Bindings, invoke 'bind' for full listing:
    #
    # - Alt-Left: navigate back in directory history if command is empty
    # - Alt-Right: navigate forward in directory history if command is empty
    # - Alt-Left: move backward a word if command is populated
    # - Alt-Right: move forward a word if command is populated
    # - Ctrl-Left: move forward a BIG word
    # - Ctrl-Right: move backward a BIG word
    # - Alt-d: delete forward word
    # - Alt-<backspace>: delete backward word
    # - Crlt-<backspace>: delete backward token (usually a BIG word)
    # - Ctrl-u: kill line
    # - Alt-u: undo last edit
    # - Alt-e: edit the current command in $EDITOR and execute
    # - Alt-.: append last parameter from previous command
    # - Ctrl-a/HOME/fn-left: go to start of line
    # - Ctrl-e/END/fn-right: go to end of line
    # - Ctrl-r: reverse history search
    # - Ctrl-p: append pager
    # - Ctrl-s: toggle completion search
    # - Ctrl-Alt-w: whatis current token

    # Preference alt bindings to operate on words whilst ctrl bindings should
    # work on BIGGER words.
    bind alt-left prevd-or-backward-word
    bind alt-right nextd-or-forward-word
    bind ctrl-left backward-bigword
    bind ctrl-right forward-bigword
    bind alt-backspace backward-kill-word
    bind ctrl-backspace backward-kill-token

    # Rebind 'undo' to Alt-u.
    bind alt-u undo
    # Rebind 'pager' to Ctrl-p.
    bind ctrl-p __fish_paginate
    # Rebind 'whatis' to Ctrl-Alt-w.
    bind ctrl-alt-w __fish_whatis_current_token

    # Require consecutive 'Ctrl-d's to exit.
    bind ctrl-d,ctrl-d delete-or-exit

    # Unbind unwanted default bindings.
    bind alt-l ''
    bind alt-o ''
    bind alt-p ''
    bind alt-s ''
    bind ctrl-w ''
    bind ctrl-h ''

    if test -n "$HOMEBREW_PREFIX"
        # Enable 'fzf' key bindings.
        fzf_key_bindings
    end
end
