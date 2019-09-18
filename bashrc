# Remove all previous environment defined aliases.
#
unalias -a

# Aliases.
#
alias aliases='alias | cut -c7- | bat -l ini --style=plain --paging never'
alias be='bundle exec'
alias c='_f() { cd "$@" && _z --add "$(pwd)"; }; _f'
alias cp='/bin/cp -i'
alias dir='ls -l'
alias du='du -b'
alias dus='_f() { du -sh "$@" | sort -hr | m; }; _f'
alias eq='set -f; _f() { echo $@ | bc; set +f; }; _f'
alias f='fzf --ansi --preview "bat --color=always --line-range :500 {}"'
alias fkill='fzf_kill'
alias g='_f() { if [[ $# == 0 ]]; then git status -sb; else git "$@"; fi }; _f'
alias gadd='fzf_git_add'
alias gunadd='fzf_git_unadd'
alias gll='fzf_git_log'
alias glS='fzf_git_log_pickaxe'
alias godev='export GOPATH=~/projects/go; PATH=$GOPATH/bin:$PATH; z src bluz'
alias grl='fzf_git_reflog'
alias gtop='glances --disable-bg'
alias gv='gvim 2> /dev/null'
alias h=history
alias help='tldr'
alias hrg='history | rg'
alias l1='ls -1'
alias ll='exa --long --git --color=always'
alias ll.='ll --all'
# usage: llfs +1M (find all files larger than 1 megabyte)
alias llfs='find_by_size'
alias lls='_f() { ll -r --sort=size "$@" | less; }; _f'
alias llt='_f() { ll -r --sort=modified "$@" | less; }; _f'
alias ls='ls --color --classify --human-readable --quoting-style=escape'
alias m='less'
alias mdi='meld 2>/dev/null'
alias mplayer='mplayer $* 2>/dev/null'
alias mux='tmuxinator'
alias mv='/bin/mv -i'
alias p='bat'
alias pping='prettyping --nolegend'
alias psu='ps -u $USER -f'
alias qmv='qmv -f do'
alias rg='rg --smart-case'
alias rgm='_f() { rg -p "$1" | less; }; _f'
alias rm='/bin/rm -i'
alias rmrf='/bin/rm -rf'
alias rs='rsync --archive --human-readable --progress --verbose'
alias src='. ~/.bashrc'
alias t='tree -C'
alias tl='tree -C -L'
alias td='tree -C -d'
alias tdl='tree -C -d -L'
alias tnew='tmux new -s $(basename $(pwd) | cut -d"." -f1)'
alias v='nvim'
alias vdi='nvim -d'
alias vf='fzf_find_edit'
alias vg='grep_edit'
alias vim='stty -ixon && vim 2> /dev/null'
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
#   mi - completion options color (Bash 4.4 and later)
#   so - completion matching-prefix color (Bash 4.4 and later)
export LS_COLORS="no=00:fi=00:di=38;5;111:ln=38;5;51:pi=38;5;43:bd=38;5;212:\
cd=38;5;225:or=30;48;5;202:ow=38;5;75:so=38;5;177:su=36;48;5;63:ex=38;5;156:\
mi=38;5;115:*.exe=38;5;156:*.bat=38;5;156:*.tar=38;5;204:*.tgz=38;5;205:\
*.tbz2=38;5;205:*.zip=38;5;206:*.7z=38;5;206:*.gz=38;5;205:*.bz2=38;5;205:\
*.rar=38;5;205:*.rpm=38;5;173:*.deb=38;5;173:*.dmg=38;5;173:*.jpg=38;5;141:\
*.jpeg=38;5;147:*.png=38;5;147:*.mpg=38;5;151:*.avi=38;5;151:*.mov=38;5;216:\
*.wmv=38;5;216:*.mp4=38;5;217:*.mkv=38;5;216:*.flac=38;5;223:*.mp3=38;5;218:\
*.wav=38;5;213:\
*akefile=38;5;176:*.pdf=38;5;253:*.ods=38;5;224:*.odt=38;5;146:\
*.doc=38;5;224:*.xls=38;5;146:*.docx=38;5;224:*.xlsx=38;5;146:\
*.epub=38;5;152:*.mobi=38;5;105:*.m4b=38;5;222:*.conf=38;5;121:\
*.md=38;5;224:*.markdown=38;5;224:*.ico=38;5;140:*.iso=38;5;205"
export EXA_COLORS="da=38;5;252:sb=38;5;204:sn=38;5;43:\
uu=38;5;245:un=38;5;241:ur=38;5;223:uw=38;5;223:ux=38;5;223:ue=38;5;223:\
gr=38;5;153:gw=38;5;153:gx=38;5;153:tr=38;5;175:tw=38;5;175:tx=38;5;175:\
gm=38;5;203:ga=38;5;203:xa=38;5;239:*.ts=00"
export PAGER=less

# What platform are we running on.
export OS=`uname`

# History settings.
HISTCONTROL='erasedups:ignoreboth' # Erase duplicates
HISTFILESIZE=50000                 # Max size of history file
HISTIGNORE=?:??                    # Ignore one and two letter commands
HISTSIZE=50000                     # Amount of history to save
# Note, to immediately append to history file see 'prompt' function below.

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

# Prevent file overwrite on stdout redirection.
# Use `>|` to force redirection to an existing file.
set -o noclobber

# Set the appropriate umask.
umask 002

# Use neovim-remote to prevent running neovim within neovim (via `:terminal`).
if [[ -n $NVIM_LISTEN_ADDRESS ]]; then
    alias nvim='nvr -cc split'
    export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
fi

# Customizations per platform.
if [[ $OS = Linux ]]; then
    alias cpa='/bin/cp -a'
    alias free='free -th'
    alias open='xdg-open 2>/dev/null'
elif [[ $OS = Darwin ]]; then
    alias cpa='/usr/local/opt/coreutils/libexec/gnubin/cp -a'
    export GTK_THEME='Meld-Mojave-light' # Force light theme for 'meld'
fi


# Functions.
#
brew_config() {
    if ! [[ -x $(command -v brew) ]]; then
        echo 'Note: brew is not installed.'
        return
    fi

    local brew_prefix=$(brew --prefix)

    # Bash completions.
    . $brew_prefix/share/bash-completion/bash_completion

    # 'z' configuration.
    _Z_NO_PROMPT_COMMAND=1
    . $brew_prefix/etc/profile.d/z.sh

    # Custom Bash completions.
    for f in ~/dotfiles/bash_completion.d/*; do . $f; done

    # Make 'g' alias to Git work with bash-completion.
    complete -o default -o nospace -F _git g

    # Setup chruby if available.
    if [[ -f $brew_prefix/share/chruby/chruby.sh ]]; then
        . $brew_prefix/share/chruby/chruby.sh
        chruby 2.6.2
    fi

    # 'fzf' configuration.
    . $brew_prefix/opt/fzf/shell/key-bindings.bash
    export FZF_DEFAULT_OPTS='
      --height 75% --multi --reverse
      --bind ctrl-f:page-down,ctrl-b:page-up
      --prompt="❯ "
      --color hl:13,fg+:253,bg+:234,hl+:13
      --color info:11,border:237,prompt:111,pointer:9,marker:8,spinner:10,header:4
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
    if [[ -n $file ]]; then
        $EDITOR $file
    fi
}

fzf_git_add() {
    local files=$(git ls-files --modified | fzf --ansi)
    if [[ -n $files ]]; then
        git add --verbose $files
    fi
}

fzf_git_log() {
    local commits=$(
      git ll --color=always "$@" |
        fzf --ansi --no-sort --height 100% \
            --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 |
                       xargs -I@ sh -c 'git show --color=always @'"
      )
    if [[ -n $commits ]]; then
        local hashes=$(printf "$commits" | cut -d' ' -f2 | tr '\n' ' ')
        git show $hashes
    fi
}

fzf_git_log_pickaxe() {
    if [[ $# == 0 ]]; then
        echo 'Error: search term was not provided.'
        return
    fi
    local commits=$(
      git log --oneline --color=always -S "$@" |
        fzf --ansi --no-sort --height 100% \
            --preview "git show --color=always {1}"
      )
    if [[ -n $commits ]]; then
        local hashes=$(printf "$commits" | cut -d' ' -f1 | tr '\n' ' ')
        git show $hashes
    fi
}

fzf_git_reflog() {
    local hash=$(
      git reflog --color=always "$@" |
        fzf --no-multi --ansi --no-sort --height 100% \
            --preview "git show --color=always {1}"
      )
    echo $hash
}

fzf_git_unadd() {
    local files=$(git diff --name-only --cached | fzf --ansi)
    if [[ -n $files ]]; then
        git unadd $files
    fi
}

fzf_kill() {
    local pids=$(
      ps -f -u $USER | sed 1d | fzf | tr -s [:blank:] | cut -d' ' -f3
      )
    if [[ -n $pids ]]; then
        echo "$pids" | xargs kill -9 "$@"
    fi
}

grep_edit() {
    if [[ $# == 0 ]]; then
        echo 'Error: search term was not provided.'
        return
    fi

    $EDITOR $(rg -l "$1")
}

path() {
    PATH=/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin
    export MANPATH=/usr/local/man:/usr/local/share/man:/usr/man:/usr/share/man
    if [[ $OS = Darwin ]]; then
        PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
        MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
    elif [[ -d ~/.linuxbrew ]]; then
        PATH=~/.linuxbrew/bin:$PATH
        MANPATH=~/.linuxbrew/share/man:$MANPATH
    fi

    PATH=~/scripts:$PATH
}

prompt() {
    # Please first install the seafly Bash prompt.
    #   git clone https://github.com/bluz71/bash-seafly-prompt ~/.bash-seafly-prompt
    SEAFLY_PRE_COMMAND="history -a"
    SEAFLY_GIT_PREFIX=" "
    . ~/.bash-seafly-prompt/command_prompt.bash
}


# Set environment.
#
path
brew_config
prompt
