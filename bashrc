# Remove all previous environment defined aliases.
#
unalias -a

# General aliases.
#
alias be='bundle exec'
alias cp='/bin/cp -i'
alias di='meld 2>/dev/null'
alias dir='pushd . > /dev/null; ls -l'
# usage: cd ~1 (change to a particular pushed directory)
alias dirs='dirs -v'
alias du='du -b'
alias g=git
# These statements are required for bash completion to work with the g alias.
if [ -f /usr/share/bash-completion/completions/git ]; then
    . /usr/share/bash-completion/completions/git
fi
complete -o default -o nospace -F _git g
# Support for golang development.
alias godev='export GOPATH=~/projects/go; PATH=$GOPATH/bin:$PATH; cd $GOPATH/src/bluz71'
alias gv='gvim 2> /dev/null'
alias gvdi=gvimdiff
alias h=history
alias hrg='history | rg'
alias l1='ls -1'
alias ll='ls -l'
alias lla='ls -la'
alias ls='ls --color --classify --human-readable'
alias lss='ls -la --sort=size | less'
alias lst='ls -la --sort=time | less'
# usage: lsfs +1M (find all files larger than 1 megabyte) 
alias lsfs='findBySize(){ find . -type f -size "$1" -exec ls --color --classify --human-readable -l {} \; ; }; findBySize'
alias m='less'
alias mux='tmuxinator'
# mmv usage: mmv "*.jpeg" "#1.jpg"
alias mv='/bin/mv -i'
alias nv='nvim'
alias p='pygmentize -g'
alias psu='ps -u $USER -f'
alias rgm='ripgrepPaged(){ rg -p "$1" | less; }; ripgrepPaged'
alias rm='/bin/rm -i'
alias rs='rsync --archive --human-readable --progress --verbose'
alias src='. ~/.bashrc'
alias t='tree -C'
alias tl='tree -C -L'
alias ta='tree -C -a'
alias td='tree -C -d'
alias tdl='tree -C -d -L'
alias tnew='tmux new -s $(basename $(pwd))'
alias v='stty -ixon && vim 2> /dev/null'
alias vi='stty -ixon && vim 2> /dev/null'
alias vdi='stty -ixon && vimdiff'
alias x=exit
# Quick parent directory navigation.
alias ..='cd ..'
alias ..2='..; ..'
alias ..3='..2; ..'
alias ..4='..3; ..'
alias ..5='..4; ..'
# Quick access directory targets.
alias documents="cd $HOME/Documents"
alias dotfiles="cd $HOME/dotfiles"
alias downloads="cd $HOME/Downloads"
alias platters="cd $HOME/projects/platters"
alias platters_app="cd $HOME/projects/platters_app"
alias projects="cd $HOME/projects"


# General environment variables.
#
export EDITOR=vim
export LESS='-Q -R -X -F -s -i -g'
export LESS_TERMCAP_md=$(printf "\e[00;34m")
export LESS_TERMCAP_us=$(printf "\e[01;32m")
export LESSHISTFILE=-
export LS_COLORS="no=00:fi=00:di=38;5;111:ln=38;5;51:pi=38;5;43:bd=38;5;212:\
cd=38;5;223:or=30;48;5;202:ow=38;5;75:so=38;5;169:su=36;48;5;63:ex=38;5;156:\
mi=38;5;115:*.exe=38;5;156:*.bat=38;5;156:*.tar=38;5;204:*.tgz=38;5;205:\
*.tbz2=38;5;205:*.zip=38;5;206:*.7z=38;5;206:*.gz=38;5;205:*.bz2=38;5;205:\
*.rar=38;5;205:*.rpm=38;5;173:*.deb=38;5;173:*.dmg=38;5;173:*.jpg=38;5;141:\
*.png=38;5;147:*.mpg=38;5;151:*.avi=38;5;151:*.mov=38;5;216:*.wmv=38;5;216:\
*.mp4=38;5;217:*.mkv=38;5;216:*.flac=38;5;222:*.mp3=38;5;218:*akefile=38;5;177:\
*.pdf=38;5;253:*.ods=38;5;224:*.odt=38;5;146:*.doc=38;5;224:*.xls=38;5;146:\
*.docx=38;5;224:*.xlsx=38;5;146:*.epub=38;5;152:*.mobi=38;5;105:\
*.m4b=38;5;187:*.conf=38;5;121"
export PAGER=less

# What platform are we running on.
export OS=`uname`


# Customizations per platform.
#
if [ $OS = Linux ]; then
    alias open='xdg-open'
    . ~/.linuxbrew/etc/bash_completion
elif [ $OS = Darwin ]; then
    . /usr/local/etc/bash_completion
elif [ $OSTYPE = cygwin ]; then
    export CYGWIN=nodosfilewarning
fi

# Custom bash completions.
for f in ~/dotfiles/bash_completion.d/*; do . $f; done


# History settings.
#
HISTCONTROL='erasedups:ignoreboth'  # Erase duplicates
HISTFILE="/tmp/.bash_history_$USER" # Use fast temporary storage
HISTFILESIZE=600                    # Max size of history file
HISTSIZE=300                        # Amount of history to save
PROMPT_COMMAND='history -a'         # Append to the history file immediately

# Enable the useful Bash 4 features:
#  - autocd, no need to type 'cd' when changing directory
#  - cdspell, automatically fix small directory typos when changing directory
#  - globstar, ** recursive glob
#  - histappend, append to history, don't overwrite
#  - nocaseglob, case-insensitive globbing
shopt -s autocd cdspell globstar histappend nocaseglob

# Only display up to four directory components in the prompt.
PROMPT_DIRTRIM=4

# Prevent file overwrite on stdout redirection.
# Use `>|` to force redirection to an existing file.
set -o noclobber

# Enable history expansion with space.
bind Space:magic-space

# Set the appropriate umask.
umask 002


# Functions.
#
libraryPath()
{
    export LD_LIBRARY_PATH=/usr/local/lib
}

path()
{
    PATH=/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin
    export MANPATH=/usr/local/man:/usr/local/share/man:/usr/man:/usr/share/man
    if [ $OS = Darwin ]; then
        PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
        MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

        # Setup chruby if available.
        if [ -f /usr/local/share/chruby/chruby.sh ]; then
            . /usr/local/share/chruby/chruby.sh
            chruby 2.5.0
        fi
    elif [ -d ~/.linuxbrew ]; then
        PATH=~/.linuxbrew/bin:$PATH
        MANPATH=~/.linuxbrew/share/man:$MANPATH

        # Setup chruby if available.
        if [ -f ~/.linuxbrew/share/chruby/chruby.sh ]; then
            . ~/.linuxbrew/share/chruby/chruby.sh
            chruby 2.5.0
        fi
    elif [ $OSTYPE = cygwin ]; then
        PATH=$PATH:/cygdrive/c/windows:/cygdrive/c/windows/system32
    fi
    PATH=~/scripts:$PATH
}

prompt()
{
    open-color() { echo -ne "\e[38;5;$1m"; }
    close-color () { echo -ne '\e[m'; }

    local COLOR_TERMINAL=0
    if [ $TERM = xterm-256color ] || [ $TERM = "screen-256color" ]; then
        COLOR_TERMINAL=1
    fi

    local GIT_PROMPT=0
    if [ $OS = Darwin ]; then
        local GIT_PROMPT_PATH="/usr/local/etc/bash_completion.d/git-prompt.sh"
    elif [ -f /etc/bash_completion.d/git-prompt ]; then
        local GIT_PROMPT_PATH="/etc/bash_completion.d/git-prompt"
    else
        local GIT_PROMPT_PATH="/usr/share/git-core/contrib/completion/git-prompt.sh"
    fi
    if [ -f $GIT_PROMPT_PATH ]; then
        GIT_PROMPT=1
        GIT_PS1_SHOWUPSTREAM="auto"
        . $GIT_PROMPT_PATH
    fi

    # 147: Purple
    # 150: Dark Sea Green
    # 174: Light Pink
    # 187: Light Yellow
    # 255: White
    if [ $# = 1 ]; then
        if [ $COLOR_TERMINAL = 1 ] && [ $GIT_PROMPT = 1 ]; then
            PS1="\[`open-color 255`\]\h\[`close-color`\]\[`open-color 174`\] $1\[`close-color`\]\[`open-color 147`\]\$(__git_ps1)\[`close-color`\]\[`open-color 150`\] \w\[`close-color`\] > "
        elif [ $COLOR_TERMINAL = 1 ]; then
            PS1="\[`open-color 255`\]\h\[`close-color`\]\[`open-color 174`\] $1\[`close-color`\]\[`open-color 150`\] \w\[`close-color`\] > "
        else
            PS1="\h $1 \w > "
        fi
    else
        if [ $COLOR_TERMINAL = 1 ] && [ $GIT_PROMPT = 1 ]; then
            PS1="\[`open-color 255`\]\h\[`close-color`\]\[`open-color 147`\]\$(__git_ps1)\[`close-color`\]\[`open-color 150`\] \w\[`close-color`\] > "
        elif [ $COLOR_TERMINAL = 1 ]; then
            PS1="\[`open-color 255`\]\h\[`close-color`\]\[`open-color 150`\] \w\[`close-color`\] > "
        else
            PS1='\h \w > '
        fi
    fi
}


# Carry out machine specific specializations.
#
if [ $OS = Linux ]; then
    libraryPath
fi
path
prompt
