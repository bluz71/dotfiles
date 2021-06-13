# Remove all previous environment defined aliases.
#
unalias -a

# Aliases.
#
# -- Coreutils aliases --
alias cp='/bin/cp -iv'
alias mc='_f() { mkdir -p "$@" && cd "$@"; }; _f'
alias mv='/bin/mv -iv'
alias rd='rmdir -p -v'
alias rm='/bin/rm -i'
alias rmrf='/bin/rm -rf'
# -- Navigation aliases --
alias -- -='cd -'
# -- Permissions aliases --
alias 664='chmod 664'
alias 775='chmod 775'
# -- Change directory aliases --
alias cf='fzf_change_directory'
alias cg='cd $(git rev-parse --show-toplevel)'
alias cz='_f() { cd "$@" && _z --add "$(pwd)"; }; _f'
# -- Disk aliases --
alias df.='df -h .'
alias du='du -b'
alias dus='du_by_size'
# -- Docker aliases --
alias d='docker'
alias dc='docker-compose'
# -- Git aliases --
alias g='_f() { if [[ $# == 0 ]]; then git status -sb; else git "$@"; fi }; _f'
alias g~='cd "$(git rev-parse --show-toplevel)"'
alias ga='fzf_git_add'
alias gll='fzf_git_log clean'
alias glla='fzf_git_log all'
alias glS='fzf_git_log_pickaxe'
alias grl='fzf_git_reflog'
alias gu='fzf_git_unadd'
# -- History aliases --
alias h=history
alias hg='history | rg'
alias ht='history_truncate'
# -- List aliases --
alias dir='ls -l --group-directories-first'
alias l='exa --color=always --group-directories-first'
alias l1='l --oneline'
alias l1d='l1 --list-dirs'
alias lc='_f() { ls "$@" | wc -l; }; _f'
alias ll='l --long'
alias ll.='ll -d .*'
alias lld='ll --list-dirs'
alias llfs='find_by_size'
alias lls='_f() { ll -r --sort=size "$@" | less; }; _f'
alias llt='_f() { ll -r --sort=modified "$@" | less; }; _f'
alias ls='ls --color --classify --human-readable --quoting-style=escape'
# -- qmv aliases --
alias qmv='qmv -f do'
alias qmvd='qmv -d'
# -- ripgrep aliases --
alias rg='rg --smart-case'
alias rgp='_f() { rg --pretty "$1" | less; }; _f'
# -- Tree aliases --
alias t='tree -C --dirsfirst'
alias td='tree -C -d'
alias tdl='tree -C -d -L'
alias tl='tree -C --dirsfirst -L'
# -- Vim aliases --
alias gv='gvim 2> /dev/null'
alias v='nvim'
alias vdi='nvim -d'
alias vf='fzf_find_edit'
alias vg='grep_edit'
alias vim='stty -ixon && vim 2> /dev/null'
# -- Miscellaneous aliases --
alias be='bundle exec'
alias bs='br --whale-spotting'
alias c='clear'
alias eq='set -f; _f() { echo $@ | bc; set +f; }; _f'
alias f='fzf --ansi'
alias fkill='fzf_kill'
alias gtop='glances --disable-bg'
alias m='less'
alias mdi='meld 2>/dev/null'
alias mux='tmuxinator'
alias p='bat'
alias pping='prettyping --nolegend -i 5'
alias psu='ps -u $USER -f'
alias rs='rsync --archive --human-readable --info=progress2 --verbose'
alias src='. ~/.bashrc'
alias sudo='sudo '
alias tnew='tmux new -s $(basename $(pwd) | cut -d"." -f1)'
alias x=exit
alias ytest='CI=true yarn test --colors'
alias ?='navi_cheats'


# General environment variables.
#
export EDITOR=nvim
export LESS='-F -Q -M -R -X -i -g -s -x4 -z-2'
export LESS_TERMCAP_md=$'\e[00;34m'    # bold mode     - blue
export LESS_TERMCAP_us=$'\e[00;32m'    # underline     - green
export LESS_TERMCAP_so=$'\e[00;40;33m' # standout      - yellow on grey
export LESS_TERMCAP_me=$'\e[0m'        # end bold      - reset
export LESS_TERMCAP_ue=$'\e[0m'        # end underline - reset
export LESS_TERMCAP_se=$'\e[0m'        # end standout  - reset
export LESSHISTFILE=-
# Note:
#   mi - completion options color (Bash 4.4 and later)
#   so - completion matching-prefix color (Bash 4.4 and later)
export LS_COLORS="no=00:fi=00:di=38;5;111:ln=38;5;81:pi=38;5;43:bd=38;5;212:\
cd=38;5;225:or=30;48;5;202:ow=38;5;75:so=38;5;177:su=36;48;5;63:ex=38;5;156:\
mi=38;5;115:*.exe=38;5;156:*.bat=38;5;156:*.tar=38;5;204:*.tgz=38;5;205:\
*.tbz2=38;5;205:*.zip=38;5;206:*.7z=38;5;206:*.gz=38;5;205:*.bz2=38;5;205:\
*.rar=38;5;205:*.rpm=38;5;173:*.deb=38;5;173:*.dmg=38;5;173:\
*.jpg=38;5;141:*.jpeg=38;5;147:*.png=38;5;147:\
*.mpg=38;5;151:*.mpeg=38;5;151:*.avi=38;5;151:*.mov=38;5;216:*.wmv=38;5;216:\
*.mp4=38;5;217:*.mkv=38;5;216:\
*.flac=38;5;223:*.mp3=38;5;218:*.wav=38;5;213:*.ape=38;5;213::*.ogg=38;5;215:\
*akefile=38;5;176:*.pdf=38;5;253:*.ods=38;5;224:*.odt=38;5;146:\
*.doc=38;5;224:*.xls=38;5;146:*.docx=38;5;224:*.xlsx=38;5;146:\
*.epub=38;5;152:*.mobi=38;5;105:*.m4b=38;5;222:*.conf=38;5;121:\
*.md=38;5;224:*.markdown=38;5;224:*README=38;5;224:*.ico=38;5;140:\
*package.json=38;5;11:*Gemfile=38;5;11:*Dockerfile=38;5;11:\
*.iso=38;5;205"
export EXA_COLORS="reset:da=38;5;252:sb=38;5;204:sn=38;5;43:\
uu=38;5;245:un=38;5;241:ur=38;5;223:uw=38;5;223:ux=38;5;223:ue=38;5;223:\
gr=38;5;153:gw=38;5;153:gx=38;5;153:tr=38;5;175:tw=38;5;175:tx=38;5;175:\
gm=38;5;203:ga=38;5;203:xa=38;5;239:*.ts=00"
export PAGER=less

# What platform are we running on.
export OS=`uname`

# Customizations per platform.
if [[ $OS = Linux ]]; then
    alias ip='ip --color=auto'
    alias cpa='/bin/cp -i -a'
    alias dr14_tmeter='/usr/local/dr14_t.meter/dr14_tmeter'
    alias free='free -th'
    alias mplayer='mplayer $* 2>/dev/null'
    alias open='xdg-open 2>/dev/null'
    alias scp='/usr/bin/scp -r'
    alias ssh='/usr/bin/ssh'
    alias ssh-add='/usr/bin/ssh-add'
    alias updatedb='sudo /usr/bin/updatedb'
elif [[ $OS = Darwin ]]; then
    alias cpa='/usr/local/bin/gcp -i -a'
    alias scp='/usr/local/bin/scp -r'
    alias ssh='/usr/local/bin/ssh'
    alias ssh-add='/usr/local/bin/ssh-add'
    alias updatedb='PATH=/usr/bin:$PATH sudo /usr/libexec/locate.updatedb'
    export GTK_THEME='Meld-Mojave-light' # Force light theme for 'meld'
fi


# Functions.
#
brew_config() {
    if ! [[ -x $(command -v brew) ]]; then
        echo 'Note: brew is not installed.'
        return
    fi

    # Derived from 'brew shellenv' output.
    if [[ $OS == Linux ]]; then
        export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
        export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
        export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
    elif [[ $OS = Darwin ]]; then
        export HOMEBREW_PREFIX="/usr/local";
        export HOMEBREW_CELLAR="/usr/local/Cellar";
        export HOMEBREW_REPOSITORY="/usr/local/Homebrew"
    fi

    # Manually load Bash Completion, only needed for Mac since we don't brew
    # install Bash Completion in Linux, we use the system supplied version
    # instead.
    if [[ $OS = Darwin ]]; then
        # Source version 2 Bash completions.
        . $HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh
    fi

    # 'z' utility.
    _Z_NO_PROMPT_COMMAND=1
    . $HOMEBREW_PREFIX/etc/profile.d/z.sh

    # 'fzf' utility.
    . $HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.bash
}

custom_config() {
    if [[ -z $HOMEBREW_PREFIX ]]; then
        return
    fi

    # Make 'g' alias to 'git' work with Bash Completion.
    # Refer to: https://is.gd/Kp7mf0
    complete -o default -o nospace -F _git g
    # Also make 'd' and 'dc' Docker aliases work with Bash Completion.
    complete -F _docker d
    complete -F _docker_compose dc

    # Custom Bash completions.
    for f in ~/dotfiles/bash_completion.d/*; do . $f; done
    # Note: debugging Bash completions:
    # % complete | grep <<completion-of-interest>>

    # 'broot' function.
    . ~/dotfiles/profile.d/br.sh

    # 'fzf' configuration.
    export FZF_DEFAULT_OPTS='
      --height 75% --multi --reverse --margin=0,1
      --bind ctrl-f:page-down,ctrl-b:page-up
      --bind pgdn:preview-page-down,pgup:preview-page-up
      --prompt="❯ "
      --color bg+:#262626,fg+:#dadada,hl:#f09479,hl+:#f09479
      --color border:#303030,info:#cfcfb0,header:#80a0ff,spinner:#36c692
      --color prompt:#87afff,pointer:#ff5189,marker:#f09479
    '
    export FZF_DEFAULT_COMMAND='fd --type f --color=never'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_CTRL_T_OPTS='--preview "bat --color=always --line-range :500 {}"'
    export FZF_ALT_C_COMMAND='fd --type d . --color=never'
    export FZF_ALT_C_OPTS='--preview "tree -C {} | head -100"'

    # 'zfz' (https://github.com/changyuheng/fz) utility.
    . ~/dotfiles/profile.d/zfz.sh

    # 'bat' configuration.
    export BAT_CONFIG_PATH="$HOME/dotfiles/bat.conf"
}

dev_config() {
    if [[ -z $HOMEBREW_PREFIX ]]; then
        return
    fi

    if [[ -f $HOMEBREW_PREFIX/share/chruby/chruby.sh ]]; then
        . $HOMEBREW_PREFIX/share/chruby/chruby.sh
        chruby 2.7.2
    fi
    if [[ -x $HOMEBREW_PREFIX/bin/fnm ]]; then
        eval "$(fnm env)"
    fi
    if [[ -d /usr/local/Android/Sdk ]]; then
        export ANDROID_SDK_ROOT=/usr/local/Android/Sdk
        PATH=$PATH:$ANDROID_SDK_ROOT/emulator
    elif [[ -d ~/Library/Android/Sdk ]]; then
        export ANDROID_SDK_ROOT=~/Library/Android/Sdk
        PATH=$PATH:$ANDROID_SDK_ROOT/emulator
    fi
    if [[ -d /usr/local/flutter/bin ]]; then
        PATH=$PATH:/usr/local/flutter/bin
        export DART_SDK=/usr/local/flutter/bin/cache/dart-sdk
        PATH=$PATH:$DART_SDK/bin
    fi
    if [[ -d ~/projects/go ]]; then
        export GOPATH=~/projects/go
        PATH=$PATH:$GOPATH/bin
    fi
}

du_by_size() {
    if [[ $# == 0 ]]; then
        du -sh * | sort -hr | less;
    else
        du -sh "$@" | sort -hr | less;
    fi
}

find_by_size() {
    if [[ $# == 0 ]]; then
        echo "Usage: llfs <size> (e.g. 100k, +1M, +1G)"
    else
        find . -type f -size "$1" -exec exa --long {} \; ;
    fi
}

fzf_change_directory() {
    local directory=$(
      fd --type d | \
      fzf --query="$1" --no-multi --select-1 --exit-0 \
          --preview 'tree -C {} | head -100'
      )
    if [[ -n $directory ]]; then
        cd "$directory"
    fi
}

fzf_find_edit() {
    local file=$(
      fzf --query="$1" --no-multi --select-1 --exit-0 \
          --preview 'bat --color=always --line-range :500 {}'
      )
    if [[ -n $file ]]; then
        $EDITOR "$file"
    fi
}

fzf_git_add() {
    local selections=$(
      git status --porcelain | \
      fzf --ansi \
          --preview 'if (git ls-files --error-unmatch {2} &>/dev/null); then
                         git diff --color=always {2} | delta
                     else
                         bat --color=always --line-range :500 {2}
                     fi'
      )
    if [[ -n $selections ]]; then
        local files=$(echo "$selections" | cut -c 4- | tr '\n' ' ')
        git add --verbose $files
    fi
}

fzf_git_log() {
    local command='ll'
    if [[ "$1" == "all" ]]; then
        command='lla'
    fi
    shift # Consume the first argument of this function
    local selections=$(
      git $command --color=always "$@" |
        fzf --ansi --no-sort --no-height \
            --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 |
                       xargs -I@ sh -c 'git show --color=always @' |
                       delta"
      )
    if [[ -n $selections ]]; then
        local commits=$(echo "$selections" | sed 's/^[* |]*//' | cut -d' ' -f1 | tr '\n' ' ')
        git show $commits
    fi
}

fzf_git_log_pickaxe() {
    if [[ $# == 0 ]]; then
        echo 'Usage: glS <search-term>'
        return
    fi
    local selections=$(
      git log --oneline --color=always -S "$@" |
        fzf --ansi --no-sort --no-height \
            --preview 'git show --color=always {1} | delta'
      )
    if [[ -n $selections ]]; then
        local commits=$(echo "$selections" | cut -d' ' -f1 | tr '\n' ' ')
        git show $commits
    fi
}

fzf_git_reflog() {
    local selection=$(
      git reflog --color=always "$@" |
        fzf --no-multi --ansi --no-sort --no-height \
            --preview 'git show --color=always {1} | delta'
      )
    if [[ -n $selection ]]; then
        git show $(echo $selection | cut -d' ' -f1)
    fi
}

fzf_git_unadd() {
    local files=$(git diff --name-only --cached | fzf --ansi)
    if [[ -n $files ]]; then
        git unadd $files
    fi
}

fzf_kill() {
    local pid_col
    if [[ $OS = Linux ]]; then
        pid_col=2
    elif [[ $OS = Darwin ]]; then
        pid_col=3;
    else
        echo 'Error: unknown platform.'
        return
    fi
    local pids=$(
      ps -f -u $USER | sed 1d | fzf | tr -s [:blank:] | cut -d' ' -f"$pid_col"
      )
    if [[ -n $pids ]]; then
        echo "$pids" | xargs kill -9 "$@"
    fi
}

grep_edit() {
    if [[ $# == 0 ]]; then
        echo 'Usage: vg <search-term>'
        return
    fi

    $EDITOR $(rg -l "$1")
}

history_truncate() {
    # Details: https://is.gd/HPAtE5
    echo "Before: $(du -shL ~/.bash_history)"
    # Remove previous truncation leftovers.
    command rm -f /tmp/bash_history
    # First, remove duplicates.
    tac ~/.bash_history | awk '!x[$0]++' | tac > /tmp/bash_history
    # Second, remove certain basic commands.
    sed -e '/^cd/d' -e '/^cp/d' -e '/^ll/d' -e '/^ls/d' -e '/^mk/d' \
        -e '/^mv/d' -e '/^rm/d' -i /tmp/bash_history
    # Use 'cp' instead of 'mv' to deal with symlinked ~/.bash_history. Use
    # 'command' to bypass aliases.
    command cp /tmp/bash_history ~/.bash_history && command rm /tmp/bash_history
    echo "After: $(du -shL ~/.bash_history)"
    history -c && history -r
}

navi_cheats() {
    local navi_command='
      navi --print --fzf-overrides "--no-multi --no-height --no-sort"
    '
    if [[ $# == 0 ]]; then
        eval $navi_command
    else
        eval $navi_command --query "$@"
    fi
}

path() {
    PATH=/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin
    export MANPATH=/usr/local/man:/usr/local/share/man:/usr/man:/usr/share/man
    if [[ $OS = Darwin ]]; then
        PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:$PATH
        MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
    elif [[ -d /home/linuxbrew/.linuxbrew ]]; then
        PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
        MANPATH=/home/linuxbrew/.linuxbrew/share/man:$MANPATH
    fi

    PATH=~/binaries:~/scripts:$PATH
}

prompt() {
    # Please first install the seafly Bash prompt.
    #   git clone https://github.com/bluz71/bash-seafly-prompt ~/.bash-seafly-prompt
    SEAFLY_PRE_COMMAND="history -a"
    SEAFLY_GIT_PREFIX=" "
    . ~/.bash-seafly-prompt/command_prompt.bash
}

shell_config() {
    # History settings.
    HISTCONTROL=ignoreboth:erasedups # Erase duplicates
    HISTFILESIZE=99999               # Max size of history file
    HISTIGNORE=?:??                  # Ignore one and two letter commands
    HISTSIZE=99999                   # Amount of history to save
    # Note, to immediately append to history file refer to the 'prompt'
    # function.

    # Disable /etc/bashrc_Apple_Terminal Bash sessions on Mac, it does not play
    # nice with normal bash history. Also, create a ~/.bash_sessions_disable
    # file to be double sure to disable Bash sessions.
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

    # Disable Alacritty icon bouncing for interactive shells.
    # Refer to: https://is.gd/8MPdGh
    if [[ $- =~ i ]]; then
        printf "\e[?1042l"
    fi
}


# Set environment.
#
path
brew_config
custom_config
dev_config
prompt
shell_config
