. ~/.bashrc

# On Mac we want to use Homebrew SSH in preference to the system supplied SSH.
#
if [ $OS = Darwin ]; then
    echo $SSH_AUTH_SOCK | grep "com.apple.launchd" > /dev/null
    if [ $? -eq 0 ]; then
        ssh-agent | grep SSH_ > ~/.ssh-agent.sh
    fi
    . ~/.ssh-agent.sh
fi
