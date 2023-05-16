# Remove all previous environment defined aliases.
#
unalias -a
#
# Aliases.
#
# -- Coreutils aliases --
alias cp='/bin/cp -iv'
alias mc='_f() { mkdir -p "$@" && command cd "$@"; }; _f'
alias mv='/bin/mv -iv'
alias rd='rmdir -p -v'
alias rm='/bin/rm -i'
alias rmrf='/bin/rm -rf'
# -- Permissions aliases --
alias 664='chmod 664'
alias 775='chmod 775'
# -- Navigation aliases --
alias -- -='cd -'
alias -- ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cf='fzf_change_directory'
# -- Disk aliases --
alias df.='df -h .'
alias du='du -b'
alias dus='du_by_size'
# -- Docker aliases --
alias d='docker'
alias dc='docker-compose'
# -- Git aliases --
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
alias lldt='_f() { ll -r --sort=modified --list-dirs "$@" | less; }; _f'
alias llfs='find_by_size'
alias lls='_f() { ll -r --sort=size "$@" | less; }; _f'
alias llt='_f() { ll -r --sort=modified "$@" | less; }; _f'
# -- ripgrep aliases --
alias rg='rg --smart-case'
alias rgp='_f() { rg --pretty "$1" | less; }; _f'
# -- Tree aliases --
alias t='tree -C --dirsfirst'
alias td='tree -C -d'
alias tdl='tree -C -d -L'
alias tl='tree -C --dirsfirst -L'
# -- tmux aliases --
alias mux='mux_command'
alias ta='tmux attach'
alias tls='tmux ls'
alias tnew='tmux new -s $(basename $(pwd) | cut -d"." -f1)'
# -- Vim aliases --
alias gv='gvim 2> /dev/null'
alias v='TERM=alacritty nvim'
alias vdi='nvim -d'
alias vf='fzf_find_edit'
alias vg='grep_edit'
alias vim='stty -ixon && vim 2> /dev/null'
# -- Miscellaneous aliases --
alias be='bundle exec'
alias bs='br --whale-spotting'
alias c='clear'
alias cwd='copy_working_directory'
alias eq='set -f; _f() { echo $@ | bc; set +f; }; _f'
alias fkill='fzf_kill'
alias lg='lazygit'
alias lynx='lynx --accept_all_cookies'
alias m='less'
alias mdi='meld 2>/dev/null'
alias p='bat'
alias pn='pnpm'
alias px='pnpx'
alias pping='prettyping --nolegend -i 5'
alias psu='ps -u $USER -f'
alias qmv='qmv -d -f do'
alias rs='rsync --archive --human-readable --info=progress2 --verbose'
alias src='. ~/.bashrc'
alias sudo='sudo '
alias www='web_search'
alias wl='wc -l'
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
# LS_COLORS Sections:
#   Standard -- no... (refer to: https://is.gd/6MzI27)
#   Archive - 7za...
#   Package - deb...
#   Image - jpg...
#   Video - avi...
#   Audio -- flac...
#   Code -- js...
#   Configuration -- *akefile...
#   Template -- erb...
#   Style -- css...
#   Markdown -- md...
#   Document -- pdf...
# Note:
#   mi - completion options color
#   so - completion matching-prefix color
export LS_COLORS="no=00:fi=00:di=38;5;111:ln=38;5;117:pi=38;5;43:bd=38;5;212:\
cd=38;5;219:or=30;48;5;203:ow=38;5;75:so=38;5;252;48;5;0:su=38;5;168:\
ex=38;5;156:mi=38;5;115:\
*.7z=38;2;255;119;153:*.gz=38;2;255;119;153:*.iso=38;2;255;119;153:\
*.rar=38;2;255;119;153:*.tar=38;2;255;119;153:*.tgz=38;2;255;119;153:\
*.zip=38;2;255;119;153:\
*.deb=38;2;255;97;105:*.dmg=38;2;255;97;105:*.rpm=38;2;255;97;105:\
*.jpg=38;2;180;150;250:*.jpeg=38;2;180;150;250:*.png=38;2;154;150;250:\
*.avi=38;2;175;215;175:*.m4b=38;2;244;180;180:*.mp4=38;2;244;180;180:\
*.mkv=38;2;255;190;148:*.mov=38;2;255;164;121:*.mpg=38;2;175;215;175:\
*.wmv=38;2;255;177;140:\
*.flac=38;2;255;215;183:*.mp3=38;2;255;175;215:*.wav=38;2;255;169;255:\
*.js=38;2;171;184;245:*.lua=38;2;171;184;245:*.rb=38;2;171;184;245:\
*.rs=38;2;171;184;245:*.ts=38;2;171;184;245:\
*akefile=38;2;95;215;175:*.conf=38;2;95;215;175::*package.json=38;2;95;215;175:\
*pubspec.toml=38;2;95;215;175:*Cargo.toml=38;2;95;215;175:\
*Dockerfile=38;2;95;215;175:*Gemfile=38;2;95;215;175:\
*.erb=38;2;140;214;255:*.html=38;2;140;214;255:*.svelte=38;2;140;214;255:\
*.css=38;2;140;214;255:*.scss=38;2;140;214;255:\
*.md=38;2;213;218;180:*README=38;2;213;218;180:\
*.epub=38;2;173;173;231:*.mobi=38;2;173;173;231:*.ods=38;2;173;173;231:\
*.odt=38;2;173;173;231:\
*.pdf=38;2;218;218;218"
export EXA_COLORS="reset:da=38;5;252:sb=38;5;204:sn=38;5;43:\
uu=38;5;245:un=38;5;241:ur=38;5;223:uw=38;5;223:ux=38;5;223:ue=38;5;223:\
gr=38;5;153:gw=38;5;153:gx=38;5;153:tr=38;5;175:tw=38;5;175:tx=38;5;175:\
gm=38;5;203:ga=38;5;203:xa=38;5;239"
export PAGER=less

# What platform are we running on.
export OS=`uname`

# Customizations per platform.
if [[ $OS = Linux ]]; then
    alias ip='ip --color=auto'
    alias cpa='/bin/cp -i -a'
    alias dr14_tmeter='/usr/local/dr14_t.meter/dr14_tmeter'
    alias free='free -th'
    alias ls='ls --color --classify --human-readable --quoting-style=escape'
    alias mplayer='mplayer $* 2>/dev/null'
    alias nmshow='nmcli connection show'
    alias open='xdg-open 2>/dev/null'
    alias scp='/usr/bin/scp -r'
    alias ssh='/usr/bin/ssh'
    alias ssh-add='/usr/bin/ssh-add'
    alias updatedb='sudo /usr/bin/updatedb'
    alias wg0down='nmcli connection down wg0'
    alias wg0info='nmcli --overview connection show wg0'
    alias wg0up='nmcli connection up wg0'
elif [[ $OS = Darwin ]]; then
    alias cpa='/opt/homebrew/bin/gcp -i -a'
    alias ls='ls --color --classify --human-readable --quoting-style=escape'
    alias scp='/opt/homebrew/bin/scp -r'
    alias ssh='/opt/homebrew/bin/ssh'
    alias ssh-add='/opt/homebrew/bin/ssh-add'
    alias updatedb='PATH=/usr/bin:$PATH sudo /usr/libexec/locate.updatedb'
fi


# Functions.
#
brew_config() {
    if [[ $OS == Linux ]]; then
        if ! [[ -x $(command -v /home/linuxbrew/.linuxbrew/bin/brew) ]]; then
            echo 'Note: brew is not installed.'
            return
        fi
        export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
        export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
        export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
        PATH=$HOMEBREW_PREFIX/bin:$PATH
        MANPATH=$HOMEBREW_PREFIX/share/man:$MANPATH
    elif [[ $OS = Darwin ]] && [[ $(uname -m) == arm64 ]]; then
        if ! [[ -x $(command -v /opt/homebrew/bin/brew) ]]; then
            echo 'Note: brew is not installed.'
            return
        fi
        export HOMEBREW_PREFIX="/opt/homebrew";
        export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
        export HOMEBREW_REPOSITORY="/opt/homebrew"
        PATH=$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$HOMEBREW_PREFIX/opt/gnu-tar/libexec/gnubin:$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin:$HOMEBREW_PREFIX/bin:$PATH
        MANPATH=$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:$HOMEBREW_PREFIX/share/man:$MANPATH
    else
        echo 'Error: unsupported platform'
        return
    fi

    # Manually load Bash Completion, only needed for Mac since we don't brew
    # install Bash Completion in Linux, we use the system supplied version
    # instead.
    if [[ $OS = Darwin ]]; then
        # Source version 2 Bash completions.
        . $HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh
    fi

    # 'fzf' utility.
    . $HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.bash
}

bindings() {
    # Alt-Left: rotate back in the directory stack.
    #
    # Note, the use of "\C-x\C-p" intermediary will execute the 'pushd' command
    # silently AND update the prompt (refer to: https://is.gd/302mDr).
    bind -x '"\C-x\C-p": "pushd +1 &>/dev/null"'
    bind '"\e[1;3D":"\C-x\C-p\n"'
    # Alt-Right rotate forward in the directory stack.
    bind -x '"\C-x\C-n": "pushd -0 &>/dev/null"'
    bind '"\e[1;3C":"\C-x\C-n\n"'

    # Control-o, copy the current command line text to the clipboard.
    bind -x '"\C-o": "copy_command_line"'
}

# Automatically push to the directory stack when changing directories.
#
cd() {
    local target="$@"
    if [[ $# -eq 0 ]]; then
        # Handle 'cd' without arguments; change to the $HOME directory.
        target="$HOME"
    elif [[ $1 == "--" ]]; then
        # Handle 'autocd' shopt, that is just a directory name entered without
        # a preceding 'cd' command. In that case the first argument will be '--'
        # with the target directory defined by the remaining arguments.
        shift
        target="$@"
    fi

    # Note, if the target directory is the same as the current directory do
    # nothing since we don't want to populate the directory stack with
    # consecutive repeat entries.
    if [[ "$target" != "$PWD" ]]; then
        builtin pushd "$target" 1>/dev/null
    fi
}

copy_command_line() {
    if [[ $OS == Linux ]]; then
        echo -n "$READLINE_LINE" | xclip -selection clipboard -i
    elif [[ $OS = Darwin ]]; then
        echo -n "$READLINE_LINE" | pbcopy
    fi
    # Also copy command line to a tmux paste buffer if tmux is active.
    if [[ -n $TMUX ]]; then
        echo -n "$READLINE_LINE" | tmux load-buffer -
    fi
}

copy_working_directory() {
    if [[ $OS == Linux ]]; then
        echo -n ${PWD/#$HOME/\~} | tr -d "\r\n" | xclip -selection clipboard -i
    elif [[ $OS = Darwin ]]; then
        echo -n ${PWD/#$HOME/\~} | tr -d "\r\n" | pbcopy
    fi
    # Also copy current directory to a tmux paste buffer if tmux is active.
    if [[ -n $TMUX ]]; then
        echo -n ${PWD/#$HOME/\~} | tr -d "\r\n" | tmux load-buffer -
    fi
}

custom_config() {
    if [[ -z $HOMEBREW_PREFIX ]]; then
        return
    fi

    # Note, custom Bash completions are stored in ~/dotfiles/completions.
    # These are then symlinked to ~/.local/share/bash-completion for automatic
    # lazy-loading. Refer to: https://is.gd/CV7ufa

    # 'broot' function.
    . ~/dotfiles/profile.d/br.sh

    # 'fzf' configuration.
    export FZF_DEFAULT_OPTS='
      --height 75% --multi --reverse --margin=0,1
      --bind ctrl-f:page-down,ctrl-b:page-up
      --bind pgdn:preview-page-down,pgup:preview-page-up
      --marker="✚" --pointer="▶" --prompt="❯ "
      --no-separator --scrollbar="█" --border
      --color bg+:#262626,fg+:#dadada,hl:#f09479,hl+:#f09479
      --color border:#303030,info:#cfcfb0,header:#80a0ff,spinner:#36c692
      --color prompt:#87afff,pointer:#ff5189,marker:#f09479
    '
    export FZF_DEFAULT_COMMAND='fd --type f --color=never'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_CTRL_T_OPTS='--preview "bat --color=always --line-range :500 {}"'
    export FZF_ALT_C_COMMAND='fd --type d . --color=never'
    export FZF_ALT_C_OPTS='--preview "tree -C {} | head -100"'

    # 'zoxide' utility.
    eval "$(zoxide init bash)"
    . ~/dotfiles/profile.d/zoxide.sh
    export _ZO_EXCLUDE_DIRS=$HOME:$HOME/Music/*
    export _ZO_MAXAGE='20000'
    export _ZO_FZF_OPTS="
      $FZF_DEFAULT_OPTS --no-multi --no-sort  --exit-0 --select-1
      --preview 'exa --color=always --group-directories-first --oneline {2..}'
    "

    # 'bat' configuration.
    export BAT_CONFIG_PATH="$HOME/dotfiles/bat.conf"

}

dev_config() {
    if [[ -z $HOMEBREW_PREFIX ]]; then
        return
    fi

    if [[ -f $HOMEBREW_PREFIX/share/chruby/chruby.sh ]]; then
        . $HOMEBREW_PREFIX/share/chruby/chruby.sh
        chruby 3.2.1
    fi
    if [[ -x $HOMEBREW_PREFIX/bin/fnm ]]; then
        eval "$(fnm env)"
        export PNPM_HOME="$HOME/.local/share/pnpm"
        PATH=$PATH:$PNPM_HOME
    fi
    if [[ -x ~/.cargo/bin ]]; then
        PATH=$PATH:~/.cargo/bin
    fi
    if [[ -d ~/projects/go ]]; then
        export GOPATH=~/projects/go
        PATH=$PATH:$GOPATH/bin
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
}

du_by_size() {
    if [[ $# -eq 0 ]]; then
        du -sh * | sort -hr | less;
    else
        du -sh "$@" | sort -hr | less;
    fi
}

find_by_size() {
    if [[ $# -eq 0 ]]; then
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
        local commits=$(echo "$selections" | sed 's/^[* |]*//' | awk '{print $1}' | tr '\n' ' ')
        git show $commits
    fi
}

fzf_git_log_pickaxe() {
    if [[ $# -eq 0 ]]; then
        echo 'Usage: glS <search-term>'
        return
    fi
    local selections=$(
      git log --oneline --color=always -S "$@" |
        fzf --ansi --no-sort --no-height \
            --preview 'git show --color=always {1} | delta'
      )
    if [[ -n $selections ]]; then
        local commits=$(echo "$selections" | awk '{print $1}' | tr '\n' ' ')
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
        git show $(echo $selection | awk '{print $1}')
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

g() {
    if [[ $# -eq 0 ]]; then
        git status -sb
    else
        git "$@"
    fi
}

grep_edit() {
    if [[ $# -eq 0 ]]; then
        echo 'Usage: vg <search-term>'
        return
    fi

    $EDITOR $(rg -l "$1")
}

history_truncate() {
    # Details: https://is.gd/HPAtE5
    echo "Before: $(du -shL $HISTFILE)"
    # Remove previous truncation leftovers.
    command rm -f /tmp/history
    # First, remove duplicates.
    tac $HISTFILE | awk '!x[$0]++' | tac > /tmp/history
    # Second, remove certain basic commands.
    sed -e '/^cd/d' -e '/^cp/d' -e '/^dr/d' -e '/^fd/d' -e '/^ll/d' \
        -e '/^ls/d' -e '/^mc/d' \-e '/^mk/d' -e '/^mv/d' -e '/^open/d' \
        -e '/^qmv/d' -e '/^rg/d'  -e '/^rm/d' -e '/^un/d' -e '/^v /d' \
        -e '/^you/d' -e '/^yt/d' -e '/^z/d' -i /tmp/history
    # Use 'cp' instead of 'mv' to deal with symlinked ~/.history. Use
    # 'command' to bypass aliases.
    command cp /tmp/history $HISTFILE && command rm /tmp/history
    echo "After: $(du -shL $HISTFILE)"
    history -c && history -r
}

mux_command() {
    if [[ $# -eq 1 ]] && [[ $1 == "stop" ]]; then
        # Automatically stop the current session.
        tmuxinator stop $(tmux display-message -p '#S')
    else
        tmuxinator "$@"
    fi
}

navi_cheats() {
    local navi_command='
      navi --print --fzf-overrides "--no-multi --no-height --no-sort"
    '
    if [[ $# -eq 0 ]]; then
        eval $navi_command
    else
        eval $navi_command --query "$@"
    fi
}

path() {
    PATH=/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin
    export MANPATH=/usr/local/man:/usr/local/share/man:/usr/man:/usr/share/man
    PATH=~/binaries:~/scripts:$PATH
}

packages() {
    # bash-seafly-prompt (https://github.com/bluz71/bash-seafly-prompt)
    #
    # Install the package if it does not exist.
    if ! [[ -d ~/.bash-packages/bash-seafly-prompt ]]; then
        git clone --depth 1 https://github.com/bluz71/bash-seafly-prompt ~/.bash-packages/bash-seafly-prompt
    fi
    SEAFLY_NORMAL_COLOR=$(tput setaf 4)
    if [[ -n $HOMEBREW_PREFIX ]]; then
        SEAFLY_PRE_COMMAND="history -a;history -n;__zoxide_hook"
    else
        SEAFLY_PRE_COMMAND="history -a;history -n"
    fi
    SEAFLY_PROMPT_PREFIX="\
if [[ -f Gemfile ]]; then\
    echo \"$(tput setaf 202)●$(tput setaf 217) Ruby\";\
elif [[ -f package.json ]]; then\
    echo \"$(tput setaf 79)●$(tput setaf 217) Node\"; \
elif [[ -f Cargo.toml ]]; then\
    echo \"$(tput setaf 208)●$(tput setaf 217) Rust\";\
elif [[ -f pubspec.yaml ]]; then\
    echo \"$(tput setaf 111)●$(tput setaf 217) Dart\";\
fi"
    . ~/.bash-packages/bash-seafly-prompt/command_prompt.bash

    # fzf-tab-completion (https://github.com/lincheney/fzf-tab-completion)
    #
    # Install the package if it does not exist.
    if ! [[ -d ~/.bash-packages/fzf-tab-completion ]]; then
        git clone --depth 1 https://github.com/lincheney/fzf-tab-completion ~/.bash-packages/fzf-tab-completion
    fi
    . ~/.bash-packages/fzf-tab-completion/bash/fzf-bash-completion.sh
    bind -x '"\C-f": fzf_bash_completion'
    export FZF_COMPLETION_OPTS="$FZF_DEFAULT_OPTS --height 60% --info=hidden"
}

shell_config() {
    # History settings.
    HISTCONTROL=ignoreboth:erasedups # Erase duplicates
    HISTFILE=$HOME/.history          # Custom history file
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

    # Only logout if 'Control-d' is executed two consecutive times.
    export IGNOREEOF=1

    # Set the appropriate umask.
    umask 002

    # Disable Alacritty icon bouncing for interactive shells.
    # Refer to: https://is.gd/8MPdGh
    if [[ $- =~ i ]]; then
        printf "\e[?1042l"
    fi
}

web_search() {
    GOLD=$(tput setaf 222)
    GREEN=$(tput setaf 79)
    NC=$(tput sgr0)

    read -ep "$(echo -e "${GOLD}Search ${GREEN}➜ ${NC}")" search_term
    open "https://duckduckgo.com/?q=${search_term}" &>/dev/null
}


# Set environment.
#
path
brew_config
custom_config
packages
dev_config
shell_config
bindings
