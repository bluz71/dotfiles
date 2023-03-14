. ~/.bashrc

# Make sure ~/.bash_history has not been truncated
if [[ $(wc -l ~/.bash_history | awk '{print $1}') -lt 1000 ]]; then
    echo 'Note: ~/.bash_history appears to be have been truncated.'
fi

if [[ $OS = Darwin ]]; then
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

    # Start Colima container manager in the background, if needed.
    colima status >& /dev/null
    if [[ $? -ne 0 ]]; then
      colima start >& /dev/null & disown
    fi
fi
