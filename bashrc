# What platform are we running on.
#
export OS=`uname`

# Remove all previous environment defined aliases.
#
unalias -a

# General aliases.
#
alias agm='ag --pager=less'
alias cp='/bin/cp -i'
alias dir='ls -l'
alias du='du -b'
alias g=git
# This is required for bash completion to work with the g alias.
complete -o default -o nospace -F _git g
alias gv=gvim
alias gvdi=gvimdiff
alias h=history
alias ha='history | ag'
alias l1='ls -1'
alias ll='ls -l'
alias lla='ls -la'
alias ls='ls --color --classify --human-readable'
alias lss='ls -la --sort=size | less'
alias lst='ls -la --sort=time | less'
alias lsfs='findBySize(){ find . -type f -size "$1" -exec ls --color --classify --human-readable -l {} \; ; }; findBySize'
alias m='less'
alias meld='meld 2>/dev/null'
alias mv='/bin/mv -i'
alias p='pygmentize -g'
alias psu='ps -u $USER -f'
alias rm='/bin/rm -i'
alias src='. ~/.bashrc'
alias tnew='tmux new -s $(basename $(pwd))'
if [ $OS = Darwin ]; then
    alias v='stty -ixon && mvim -v'
    alias vdi='stty -ixon && mvimdiff -v'
else
    alias v='stty -ixon && vimx'
    alias vdi='stty -ixon && vimdiff'
fi
alias x=exit
alias ..='cd ..'
alias ..2='..; ..'
alias ..3='..2; ..'
alias ..4='..3; ..'
alias ..5='..4; ..'


# General environment variables.
#
export LS_COLORS="no=00:fi=00:di=38;5;111:ln=38;5;51:pi=38;5;43:bd=38;5;212:cd=38;5;223:or=30;48;5;202:ow=38;5;203:so=38;5;169:su=36;48;5;63:ex=38;5;156:mi=30;48;5;83:*.exe=38;5;156:*.bat=38;5;156:*.tar=38;5;204:*.tgz=38;5;205:*.tbz2=38;5;205:*.zip=38;5;206:*.7z=38;5;206:*.gz=38;5;205:*.bz2=38;5;205:*.rar=38;5;205:*.rpm=38;5;173:*.jpg=38;5;141:*.png=38;5;147:*.mpg=38;5;151:*.avi=38;5;151:*.mov=38;5;216:*.wmv=38;5;216:*.mp4=38;5;217:*.mkv=38;5;216:*.flac=38;5;222:*.mp3=38;5;218:*akefile=38;5;177:*.pdf=38;5;253:*.ods=38;5;224:*.odt=38;5;146:*.doc=38;5;224:*.xls=38;5;146:*.docx=38;5;224:*.xlsx=38;5;146:*.epub=38;5;152:*.conf=38;5;121"
export PAGER=less
export LESS='-R -X -F -s -i -g'
export LESSHISTFILE=-

# Custom environment variables per platform.
#
if [ $OS = Linux ]; then
    export EDITOR=vimx
    export HOST=`hostname -s`
elif [ $OS = Darwin ]; then
    export EDITOR='mvim -v'
elif [ $OSTYPE = cygwin ]; then
    export CYGWIN=nodosfilewarning
    export EDITOR='vim'
    export HOST=`hostname`
    if [ $TERM = cygwin ]; then
        unset LS_COLORS
    fi
fi

# By default bash saves away too much history, set the history size to a saner
# value.
#
HISTSIZE=200
HISTFILESIZE=0
HISTCONTROL='erasedups:ignoreboth'

# Set the appropriate umask.
#
umask 002

# Enable the useful Bash 4 features:
#  autocd, no need to type 'cd' when changing directory
#  cdable_vars, 'cd FOO' where FOO is an environment variable
#  cdspell, automatically fix small directory typos when changing directory
#  globstar, ** recursive glob
shopt -s autocd cdable_vars cdspell globstar

# Only display up to four directory components in the prompt.
PROMPT_DIRTRIM=4


# Functions.
#
libraryPath()
{
    export LD_LIBRARY_PATH=~/local/lib:/usr/local/lib
}

path()
{
    PATH=/usr/local/bin:/bin:/usr/bin:/usr/sbin
    export MANPATH=~/local/man:/usr/local/man:/usr/man:/usr/share/man
    if [ $OSTYPE = cygwin ]; then
        PATH=$PATH:/cygdrive/c/windows:/cygdrive/c/windows/system32
    fi
    PATH=~/local/bin:~/scripts:'.':$PATH
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
    if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
        GIT_PROMPT=1
        GIT_PS1_SHOWUPSTREAM="auto"
        . /usr/share/git-core/contrib/completion/git-prompt.sh
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
