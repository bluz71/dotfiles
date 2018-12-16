# Remove all previous environment defined aliases.
#
unalias -a

# Aliases.
#
alias be='bundle exec'
alias c='cd'
alias cp='/bin/cp -i'
alias di='meld 2>/dev/null'
alias dir='ls -l'
alias du='du -b'
alias f='fzf --ansi --preview "bat --color=always --line-range :500 {}"'
alias fkill='fzf_kill'
alias g=git
alias gadd='fzf_git_add'
alias gunadd='fzf_git_unadd'
alias gll='fzf_git_log'
# Support for golang development.
alias godev='export GOPATH=~/projects/go; \
PATH=$GOPATH/bin:$PATH; cd $GOPATH/src/bluz71'
alias gtop='glances --disable-bg'
alias gv='gvim 2> /dev/null'
alias gvdi=gvimdiff
alias h=history
alias help='tldr'
alias hrg='history | rg'
alias l1='ls -1'
alias ll='ls -l'
alias ll.='ls -la'
# usage: llfs +1M (find all files larger than 1 megabyte)
alias llfs='find_by_size'
alias lls='ls_by_size(){ ls -la --sort=size "$@" | less; }; ls_by_size'
alias llt='ls_by_time(){ ls -la --sort=time "$@" | less; }; ls_by_time'
alias ls='ls --color --classify --human-readable --quoting-style=escape'
alias m='less'
alias mplayer='mplayer $* 2>/dev/null'
alias mux='tmuxinator'
alias mv='/bin/mv -i'
alias nv='nvim'
alias p='bat'
alias pping='prettyping --nolegend'
alias psu='ps -u $USER -f'
alias qmv='qmv -f do'
alias rg='rg --smart-case'
alias rgm='ripgrep_paged(){ rg -p "$1" | less; }; ripgrep_paged'
alias rm='/bin/rm -i'
alias rs='rsync --archive --human-readable --progress --verbose'
alias src='. ~/.bashrc'
alias t='tree -C'
alias tl='tree -C -L'
alias td='tree -C -d'
alias tdl='tree -C -d -L'
alias tnew='tmux new -s $(basename $(pwd) | cut -d"." -f1)'
alias v='stty -ixon && vim 2> /dev/null'
alias vf='fzf_find_edit'
alias vi='stty -ixon && vim 2> /dev/null'
alias vdi='stty -ixon && vimdiff'
alias vrg='fzf_rg_edit'
alias x=exit
alias ytest='CI=true yarn test --colors'
# Directory navigation.
alias -- -='cd -'
alias ..='cd ..'
alias ..2='..; ..'
alias ..3='..2; ..'
alias ..4='..3; ..'
alias ..5='..4; ..'


# General environment variables.
#
export EDITOR=nvim
export LESS='-Q -R -X -F -s -i -g'
export LESS_TERMCAP_md=$(printf "\e[00;34m")
export LESS_TERMCAP_us=$(printf "\e[01;32m")
export LESSHISTFILE=-
# Note:
#   mi - completion option color (Bash 4.4 and later)
#   so - completion prefix color (Bash 4.4 and later)
export LS_COLORS="no=00:fi=00:di=38;5;111:ln=38;5;51:pi=38;5;43:bd=38;5;212:\
cd=38;5;225:or=30;48;5;202:ow=38;5;75:so=38;5;177:su=36;48;5;63:ex=38;5;156:\
mi=38;5;115:*.exe=38;5;156:*.bat=38;5;156:*.tar=38;5;204:*.tgz=38;5;205:\
*.tbz2=38;5;205:*.zip=38;5;206:*.7z=38;5;206:*.gz=38;5;205:*.bz2=38;5;205:\
*.rar=38;5;205:*.rpm=38;5;173:*.deb=38;5;173:*.dmg=38;5;173:*.jpg=38;5;141:\
*.png=38;5;147:*.mpg=38;5;151:*.avi=38;5;151:*.mov=38;5;216:*.wmv=38;5;216:\
*.mp4=38;5;217:*.mkv=38;5;216:*.flac=38;5;223:*.mp3=38;5;218:*akefile=38;5;176:\
*.pdf=38;5;253:*.ods=38;5;224:*.odt=38;5;146:*.doc=38;5;224:*.xls=38;5;146:\
*.docx=38;5;224:*.xlsx=38;5;146:*.epub=38;5;152:*.mobi=38;5;105:\
*.m4b=38;5;222:*.conf=38;5;121"
export PAGER=less

# What platform are we running on.
export OS=`uname`

# History settings.
HISTCONTROL='erasedups:ignoreboth' # Erase duplicates
HISTFILESIZE=50000                 # Max size of history file
HISTIGNORE=?:??                    # Ignore one and two letter commands
HISTSIZE=50000                     # Amount of history to save
PROMPT_COMMAND='history -a'        # Append to history file immediately

# Disable /etc/bashrc_Apple_Terminal bash sessions on Mac, it does not play
# nice with normal bash history. Also, create a ~/.bash_sessions_disable file
# to be double sure to disable bash sessions.
export SHELL_SESSION_HISTORY=0

# Enable the useful Bash features:
#  - autocd, no need to type 'cd' when changing directory
#  - cdspell, automatically fix directory typos when changing directory
#  - direxpand, automatically expand directory globs when completing
#  - dirspell, automatically fix directory typos when completing
#  - globstar, ** recursive glob
#  - histappend, append to history, don't overwrite
#  - histverify, expand, but don't automatically execute, history expansions
#  - nocaseglob, case-insensitive globbing
#  - no_empty_cmd_completion, don't TAB expand empty lines
shopt -s autocd cdspell direxpand dirspell globstar histappend histverify \
    nocaseglob no_empty_cmd_completion

# Only display up to four directory components in the prompt.
PROMPT_DIRTRIM=4

# Prevent file overwrite on stdout redirection.
# Use `>|` to force redirection to an existing file.
set -o noclobber

# Set the appropriate umask.
umask 002

# Use neovim-remote to prevent running neovim within neovim (via `:terminal`).
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    alias nvim='nvr -cc split'
    export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
fi


# Functions.
#
brew_config() {
    if ! [ -x "$(command -v brew)" ]; then
        echo 'Note: brew is not installed.'
        return
    fi

    local brew_prefix=$(brew --prefix)

    # Bash completions.
    . $brew_prefix/etc/bash_completion
    . $brew_prefix/etc/profile.d/z.sh
    complete -o default -o nospace -F _git g

    # Custom bash completions.
    for f in ~/dotfiles/bash_completion.d/*; do . $f; done

    # Setup chruby if available.
    if [ -f $brew_prefix/share/chruby/chruby.sh ]; then
        . $brew_prefix/share/chruby/chruby.sh
        chruby 2.5.1
    fi

    # 'fzf' configuration.
    . $brew_prefix/opt/fzf/shell/key-bindings.bash
    export FZF_DEFAULT_OPTS='
      --height 75% --multi --reverse
      --bind ctrl-f:page-down,ctrl-b:page-up
      --color hl:13,fg+:251,bg+:234,hl+:13
      --color info:10,prompt:111,pointer:9,marker:8,spinner:10,header:4
    '
    export FZF_DEFAULT_COMMAND='fd --type f --color=never'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_CTRL_T_OPTS='--preview "bat --color=always --line-range :500 {}"'
    export FZF_ALT_C_COMMAND='fd --type d . --color=never'
    export FZF_ALT_C_OPTS='--preview "tree -C {} | head -100"'
    # This is an undocumented environment variable for use by fzf.vim, see:
    # https://github.com/junegunn/fzf.vim/pull/707
    export FZF_PREVIEW_COMMAND='bat --color=always {}'

    # 'bat' configuration.
    export BAT_CONFIG_PATH="$HOME/dotfiles/bat.conf"
}

find_by_size() {
    find . -type f -size "$1" -exec ls --color --classify --human-readable -l {} \; ;
}

fzf_find_edit() {
    local file=$(
      fzf --no-multi --preview 'bat --color=always --line-range :500 {}'
      )
    if [ -n "$file" ]; then
        $EDITOR $file
    fi
}

fzf_git_add() {
    local files=$(git ls-files --modified | fzf --ansi)
    if [ -n "$files" ]; then
        git add --verbose $files
    fi
}

fzf_git_log() {
    local commits=$(
      git ll --color=always "$@" |
        fzf --ansi --no-sort --height 100% \
            --preview "git show --color=always {2}"
      )
    if [ -n "$commits" ]; then
        local hashes=$(printf "$commits" | cut -d' ' -f2 | tr '\n' ' ')
        git show $hashes
    fi
}

fzf_git_unadd() {
    local files=$(git diff --name-only --cached | fzf --ansi)
    if [ -n "$files" ]; then
        git unadd $files
    fi
}

fzf_kill() {
    local pids=$(
      ps -f -u $USER | sed 1d | fzf | tr -s [:blank:] | cut -d' ' -f3
      )
    if [ -n "$pids" ]; then
        echo "$pids" | xargs kill -9 "$@"
    fi
}

fzf_rg_edit(){
    if [ $# == 0 ]; then
        echo 'Error: search term was not provided.'
        return
    fi
    local match=$(
      rg --color=never --line-number "$1" |
        fzf --no-multi --delimiter : \
            --preview "bat --color=always --line-range {2}: {1}"
      )
    local file=$(echo "$match" | cut -d':' -f1)
    if [ -n "$file" ]; then
        $EDITOR $file +$(echo "$match" | cut -d':' -f2)
    fi
}

path()
{
    PATH=/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin
    export MANPATH=/usr/local/man:/usr/local/share/man:/usr/man:/usr/share/man
    if [ $OS = Darwin ]; then
        PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
        MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
    elif [ -d ~/.linuxbrew ]; then
        PATH=~/.linuxbrew/bin:$PATH
        MANPATH=~/.linuxbrew/share/man:$MANPATH
    fi

    PATH=~/scripts:$PATH
}

prompt()
{
    local color_terminal=0
    if [ $TERM = xterm-256color ] || [ $TERM = "screen-256color" ]; then
        color_terminal=1
    fi

    local git_prompt=0
    if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
        local GIT_PROMPT_PATH="/usr/local/etc/bash_completion.d/git-prompt.sh"
    elif [ -f /etc/bash_completion.d/git-prompt ]; then
        local GIT_PROMPT_PATH="/etc/bash_completion.d/git-prompt"
    else
        local GIT_PROMPT_PATH="/usr/share/git-core/contrib/completion/git-prompt.sh"
    fi
    if [ -f $GIT_PROMPT_PATH ]; then
        git_prompt=1
        GIT_PS1_SHOWUPSTREAM="auto"
        GIT_PS1_SHOWSTASHSTATE=1
        . $GIT_PROMPT_PATH
    fi

    # Colors used in the prompt.
    #
    # 111: Blue
    # 147: Purple
    # 150: Green
    # 203: Red
    # 255: White

    # Helpers to open and close colors.
    col-op() { echo -ne "\e[38;5;$1m"; }
    col-cl() { echo -ne '\e[m'; }

    # Blue > indicates success for the last command run.
    # Red > indicates failure for the last command run.
    prompt_end="\`if [ \$? = 0 ]; then echo -ne '\e[38;5;111m'; else echo  -ne '\e[38;5;203m'; fi\` ❯ "

    if [ $color_terminal = 1 ] && [ $git_prompt = 1 ]; then
        PS1="\[`col-op 255`\]\h\[`col-op 147`\]\$(__git_ps1)\[`col-op 150`\] \w$prompt_end\[`col-cl`\]"
    elif [ $color_terminal = 1 ]; then
        PS1="\[`col-op 255`\]\h\[`col-op 150`\] \w$prompt_end\[`col-cl`\]"
    else
        PS1='\h \w ❯ '
    fi
}


# Customizations per platform.
#
if [ $OS = Linux ]; then
    alias open='xdg-open'
fi


# Set environment.
#
path
prompt
brew_config
