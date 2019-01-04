. ~/.bashrc

if [[ $OS = Linux && $DISPLAY ]]; then
    # Configure the CAPSLOCK key to be ESC when pressed alone or CONTROL
    # when held with another key.
    setxkbmap -option 'caps:ctrl_modifier'
    xcape -e 'Caps_Lock=Escape'

    # Use Karabiner Elements to achieve the same on macOS.
elif [[ $OS = Darwin ]]; then
    # On Mac we want to use the Homebrew SSH agent (newer and better) in
    # preference to the system supplied SSH agent (older and worse).

    # Use an existing Homebrew SSH agent if it is running and available.
    if [[ -f ~/.ssh-agent-env.sh ]]; then
        . ~/.ssh-agent-env.sh
        ps $SSH_AGENT_PID | grep ssh-agent > /dev/null
        if [[ $? -eq 0 ]]; then
            return
        fi
    fi

    # Homebrew SSH agent is not running, must start it and source it.
    ssh-agent | grep SSH_ >| ~/.ssh-agent-env.sh
    . ~/.ssh-agent-env.sh
fi
