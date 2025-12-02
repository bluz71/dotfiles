# Remove all previous environment defined aliases.
#
unalias -a

# Aliases.
#
# -- Coreutils aliases --
alias cp='/bin/cp -iv'
alias mc='_f() { mkdir -p "$@" && command cd "$@"; }; _f'
alias mv='/bin/mv -iv'
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
alias hm='history -n'
alias ht='history_truncate'
# -- List aliases --
alias dir='ls -l --group-directories-first'
alias l='eza --no-quotes --color=always --color-scale-mode=fixed --group-directories-first'
alias l1='l --oneline'
alias lc='_f() { ls "$@" | wc -l; }; _f'
alias ll='l --long'
alias ll.='ll -d .*'
alias lld='ll --list-dirs'
alias lldt='_f() { ll -r --sort=modified --list-dirs "$@" | less; }; _f'
alias llfs='find_by_size'
alias lls='_f() { ll -r --sort=size "$@" | less; }; _f'
alias llt='_f() { ll -r --sort=modified "$@" | less; }; _f'
alias ls='ls --color --classify --human-readable --quoting-style=escape'
# -- ripgrep aliases --
alias rg='rg --smart-case'
# -- Tree aliases --
alias t='eza --tree --group-directories-first'
alias td='tree -C -d'
alias tdl='tree -C -d -L'
alias tl='eza --tree --group-directories-first -L'
# -- tmux aliases --
alias mux='mux_command'
alias ta='tmux attach'
alias tls='tmux ls'
alias tnew='tmux new -s $(basename $(pwd) | cut -d"." -f1)'
# -- Vim aliases --
alias gv='gvim 2>/dev/null'
alias v='TERM=alacritty nvim'
alias vdi='nvim -d'
alias vf='fzf_find_edit'
# -- Miscellaneous aliases --
alias be='bundle exec'
alias cwd='copy_working_directory'
alias df.='df -h .'
alias dus='dust -x -r -d 1'
alias ff='fastfetch'
alias fkill='fzf_kill'
alias lynx='lynx --accept_all_cookies'
alias math='set -f; _f() { echo $@ | bc; set +f; }; _f'
alias mdi='meld'
alias p='bat'
alias pn='pnpm'
alias px='pnpx'
alias pping='prettyping --nolegend -i 5'
alias psu='ps -u $USER -f'
alias qmv='qmv -d -f do'
alias rsync='rsync --archive --human-readable --info=progress2 --verbose'
alias scp='/usr/bin/scp -r'
alias src='. ~/.bashrc'
alias ssh='/usr/bin/ssh'
alias ssh-add='/usr/bin/ssh-add'
alias sudo='sudo '
alias wl='wc -l'
alias x=exit
alias ytest='CI=true yarn test --colors'


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
# LS_COLORS (refer to: https://is.gd/6MzI27)
#   mi - completion options color
#   so - completion matching-prefix color
export LS_COLORS="no=00:fi=00:di=38;5;111:ln=38;5;117:pi=38;5;43:bd=38;5;212:\
cd=38;5;219:or=30;48;5;203:ow=38;5;75:so=38;5;252;48;5;0:su=38;5;168:\
ex=38;5;156:mi=38;5;115:\
*.avi=38;2;175;215;175:*.mpg=38;2;175;215;175:*.mp4=38;2;244;180;180:\
*.epub=38;2;200;200;246:*.dsf=38;2;255;175;215:*.conf=38;2;95;215;175:\
*.md=38;2;213;218;180:*README=38;2;213;218;180:\
*.pdf=38;2;218;218;218"
# EZA_COLORS (refer to: man eza_colors)
export EZA_COLORS="da=38;5;252:sb=38;5;204:sn=38;5;43:xa=8:\
uu=38;5;245:un=38;5;241:ur=38;5;223:uw=38;5;223:ux=38;5;223:ue=38;5;223:\
gr=38;5;153:gw=38;5;153:gx=38;5;153:tr=38;5;175:tw=38;5;175:tx=38;5;175:\
gm=38;5;203:ga=38;5;203:mp=3;38;5;111:im=38;2;180;150;250:vi=38;2;255;190;148:\
mu=38;2;255;175;215:lo=38;2;255;215;183:cr=38;2;240;160;240:\
do=38;2;200;200;246:co=38;2;255;119;153:tm=38;2;148;148;148:\
cm=38;2;230;150;210:bu=38;2;95;215;175:sc=38;2;120;220;200"
export PAGER=less
export MANPAGER='nvim +Man!'

# What platform are we running on.
export OS=$(uname)

# Customizations per platform.
if [[ $OS == "Linux" ]]; then
    export SHELL='/bin/bash'
    if [ -f /etc/arch-release ]; then
        export OS_KIND='Arch'
    elif [ -f /etc/debian_version ]; then
        export OS_KIND='Debian'
    fi
    alias ip='ip --color=auto'
    alias cpa='/bin/cp -i -dR --preserve=ownership,timestamps'
    alias dr14_tmeter='/usr/local/dr14_t.meter/dr14_tmeter'
    alias free='free -th'
    alias nmshow='nmcli connection show'
    alias updatedb='sudo /usr/bin/updatedb'
    alias wg0down='nmcli connection down wg0'
    alias wg0info='nmcli --overview connection show wg0'
    alias wg0up='nmcli connection up wg0'
elif [[ $OS == "Darwin" ]]; then
    export SHELL='/opt/homebrew/bin/bash'
    export OS_KIND='macOS'
    export PGGSSENCMODE='disable' # Reference: https://is.gd/flzYH7
    alias cpa='/opt/homebrew/bin/gcp -i -a'
    alias locate='mdfind -name'
fi


# Functions.
#
brew_config() {
    if [[ $OS == "Linux" ]] && [[ $OS_KIND == "Debian"  ]]; then
        if ! [[ -x $(command -v /home/linuxbrew/.linuxbrew/bin/brew 2>/dev/null) ]]; then
            echo 'Note: brew is not available.'
            return
        fi
        export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
        export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
        export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
        PATH=$HOMEBREW_PREFIX/bin:$PATH
        MANPATH=$HOMEBREW_PREFIX/share/man:$MANPATH
        export HOMEBREW_NO_AUTO_UPDATE=1
    elif [[ $OS == "Darwin" ]]; then
        if ! [[ -x $(command -v /opt/homebrew/bin/brew 2>/dev/null) ]]; then
            echo 'Note: brew is not available.'
            return
        fi
        export HOMEBREW_PREFIX="/opt/homebrew";
        export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
        export HOMEBREW_REPOSITORY="/opt/homebrew"
        PATH=$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$HOMEBREW_PREFIX/opt/gnu-tar/libexec/gnubin:$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin:$HOMEBREW_PREFIX/bin:$PATH
        MANPATH=$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:$HOMEBREW_PREFIX/share/man:$MANPATH
        export HOMEBREW_NO_AUTO_UPDATE=1
    elif [[ $OS_KIND == "Arch"  ]]; then
        return
    else
        echo 'Error: unsupported platform'
        return
    fi
}

cheat() {
    local navi_command='navi --print --fzf-overrides "--no-multi --no-height --no-sort"'
    if [[ $# -eq 0 ]]; then
        eval $navi_command
    else
        eval $navi_command --query "$@"
    fi
}

copy_working_directory() {
    if [[ $OS == "Linux" ]]; then
        echo -n ${PWD/#$HOME/\~} | tr -d "\r\n" | xclip -selection clipboard -i
    elif [[ $OS == "Darwin" ]]; then
        echo -n ${PWD/#$HOME/\~} | tr -d "\r\n" | pbcopy
    fi
    # Also copy current directory to a tmux paste buffer if tmux is active.
    if [[ -n $TMUX ]]; then
        echo -n ${PWD/#$HOME/\~} | tr -d "\r\n" | tmux load-buffer -
    fi
}

custom_config() {
    # Manually load Bash Completion for macOS from Homebrew.
    [[ $OS == "Darwin" ]] && . $HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh

    # Note, custom Bash completions are stored in ~/dotfiles/completions.
    # These are then symlinked to ~/.local/share/bash-completion for automatic
    # lazy-loading. Refer to: https://is.gd/CV7ufa

    # 'fzf' utility.
    [[ -n $HOMEBREW_PREFIX ]] && . $HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.bash
    [[ $OS_KIND == "Arch" ]] && . /usr/share/fzf/key-bindings.bash
    export FZF_DEFAULT_OPTS='
      --height 75% --multi --reverse --margin=0,1
      --bind ctrl-f:page-down,ctrl-b:page-up
      --bind pgdn:preview-page-down,pgup:preview-page-up
      --marker="✚" --pointer="▶" --prompt="❯ "
      --no-separator --scrollbar="█" --border
      --color bg:#080808,bg+:#262626,border:#303030,fg:#b2b2b2,fg+:#dadada
      --color gutter:#262626,header:#80a0ff,hl:#f09479,hl+:#f09479
      --color info:#cfcfb0,marker:#f09479,pointer:#ff5189,prompt:#87afff
      --color spinner:#36c692
    '
    export FZF_DEFAULT_COMMAND='fd --type f --color=never'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_CTRL_T_OPTS='--preview "bat --color=always --line-range :500 {}"'
    export FZF_ALT_C_COMMAND='fd --type d . --color=never'
    export FZF_ALT_C_OPTS='--preview "tree -C {} | head -100"'

    # 'zoxide' utility.
    eval "$(zoxide init bash)"
    export _ZO_EXCLUDE_DIRS=$HOME:$HOME/Music/*
    export _ZO_MAXAGE='20000'
    export _ZO_FZF_OPTS="
      $FZF_DEFAULT_OPTS --no-multi --no-sort  --exit-0 --select-1
      --preview 'eza --no-quotes --color=always --color-scale-mode=fixed --group-directories-first --oneline {2..}'
    "

    # 'bat' configuration.
    export BAT_CONFIG_PATH="$HOME/dotfiles/bat.conf"
}

dev_config() {
    if [[ -f $HOMEBREW_PREFIX/share/chruby/chruby.sh || -f /usr/share/chruby/chruby.sh ]]; then
        # chruby is slow, instead simply set environment variables explicitly.
        # . $HOMEBREW_PREFIX/share/chruby/chruby.sh
        # chruby 3.3.9
        export RUBY_VERSION=3.3.9
        export RUBY_ROOT=$HOME/.rubies/ruby-$RUBY_VERSION
        export GEM_ROOT=$RUBY_ROOT/lib/ruby/gems/3.3.0
        export GEM_HOME=$HOME/.gem/ruby/$RUBY_VERSION
        export GEM_PATH=$GEM_HOME:$GEM_ROOT
        PATH=$GEM_HOME/bin:$RUBY_ROOT/bin:$PATH
        hash -r
    fi
    if [[ -x $HOMEBREW_PREFIX/bin/fnm ]]; then
        eval "$(fnm env)"
        export PNPM_HOME=$HOME/.local/share/pnpm
        PATH=$PATH:$PNPM_HOME
    fi
    if [[ -x ~/.cargo/bin ]]; then
        PATH=$PATH:~/.cargo/bin
    fi
    if [[ -d ~/projects/go ]]; then
        export GOPATH=~/projects/go
        PATH=$PATH:$GOPATH/bin
    fi
}

find_by_size() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: llfs <size> (e.g. 100k, +1M, +1G)"
    else
        find . -type f -size "$1" -exec eza --long {} \; ;
    fi
}

fzf_find_edit() {
    local file=$(
      fzf --query="$1" --no-multi --select-1 --exit-0 \
          --preview 'bat --color=always --line-range :500 {}'
    )
    if [[ -n "$file" ]]; then
        $EDITOR "$file"
    fi
}

fzf_git_add() {
    local selections=$(
      git ls-files -m -o --exclude-standard | \
        fzf --ansi \
            --preview 'if (git ls-files --error-unmatch {1} &>/dev/null); then
                           git diff --color=always {1} | delta
                       else
                           bat --color=always --line-range :500 {1}
                       fi'
    )
    if [[ -n $selections ]]; then
        git add --verbose $selections
    fi
}

fzf_git_log() {
    local command='ll'
    if [[ "$1" == "all" ]]; then
        command='lla'
    fi
    shift # Consume the first argument of this function
    local selection=$(
      git $command --color=always "$@" | \
        fzf --no-multi --ansi --no-sort --no-height \
            --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 |
                       xargs -I@ sh -c 'git show --color=always @' |
                       delta"
    )
    if [[ -n $selection ]]; then
        local commit=$(echo "$selection" | sed 's/^[* |]*//' | awk '{print $1}' | tr -d '\n')
        git show $commit
    fi
}

fzf_git_log_pickaxe() {
    if [[ $# -eq 0 ]]; then
        echo 'Usage: glS <search-term>'
        return
    fi
    local selection=$(
      git log --oneline --color=always -S "$@" |
        fzf --no-multi --ansi --no-sort --no-height \
            --preview 'git show --color=always {1} | delta'
    )
    if [[ -n "$selection" ]]; then
        local commit=$(echo "$selection" | awk '{print $1}' | tr -d '\n')
        git show $commit
    fi
}

fzf_git_reflog() {
    local selection=$(
      git reflog --color=always "$@" |
        fzf --no-multi --ansi --no-sort --no-height \
            --preview 'git show --color=always {1} | delta'
    )
    if [[ -n "$selection" ]]; then
        git show $(echo "$selection" | awk '{print $1}')
    fi
}

fzf_git_unadd() {
    local changes=$(git diff --name-only --cached | fzf --ansi | tr '\n' ' ')
    if [[ -n "$changes" ]]; then
        git reset HEAD $changes
    fi
}

fzf_kill() {
    if [[ $OS == "Linux" ]]; then
        local pids=$(ps -f -u $USER | sed 1d | fzf | awk '{print $2}')
    elif [[ $OS == "Darwin" ]]; then
        local pids=$(ps -f -u $USER | sed 1d | fzf | awk '{print $3}')
    else
        echo 'Error: unknown platform.'
        return
    fi
    if [[ -n "$pids" ]]; then
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
        # First stop any running containers.
        docker container stop $(docker container ls --quiet) >/dev/null 2>&1
        # Now stop the current session.
        tmuxinator stop $(tmux display-message -p '#S')
    else
        tmuxinator "$@"
    fi
}

prompt() {
    # bash-seafly-prompt (https://github.com/bluz71/bash-seafly-prompt)
    #
    # Install the package if it does not exist.
    if ! [[ -d ~/.bash-packages/bash-seafly-prompt ]]; then
        git clone --depth 1 https://github.com/bluz71/bash-seafly-prompt ~/.bash-packages/bash-seafly-prompt
    fi
    SEAFLY_SUCCESS_COLOR=$(echo -ne '\e[38;5;4m')
    SEAFLY_PROMPT_SYMBOL="❮b❯"
    seafly_pre_command_hook="seafly_pre_command"
    seafly_prompt_prefix_hook="seafly_prompt_prefix"
    # Custom colors for prompt prefix; for performance reasons calculate the
    # colors outside the 'seafly_prompt_prefix' function.
    . ~/.bash-packages/bash-seafly-prompt/command_prompt.bash
}

seafly_pre_command() {
    if [[ -n $HOMEBREW_PREFIX ]]; then
        history -a
        __zoxide_hook
    else
        history -a
    fi
}

seafly_prompt_prefix() {
    if [[ -f Gemfile ]]; then
        echo "\e[38;5;1m◢"
    elif [[ -f package.json ]]; then
        echo "\e[38;5;79m⬢"
    elif [[ -f Cargo.toml ]]; then
        echo "\e[38;5;208m●"
    elif [[ -f pubspec.yaml ]]; then
        echo "\e[38;5;12m◀"
    fi
}

shell_config() {
    # First, make sure ~/.history has not been truncated.
    if [[ $(wc -l ~/.history | awk '{print $1}') -lt 1000 ]]; then
        echo 'Note: ~/.history appears to be have been truncated.'
    fi

    # History settings.
    HISTCONTROL=ignoreboth:erasedups # Ignore and erase duplicates
    HISTFILE=$HOME/.history          # Custom history file
    HISTFILESIZE=99999               # Max size of history file
    HISTIGNORE=?:??                  # Ignore one and two letter commands
    HISTSIZE=99999                   # Amount of history to preserve
    # Note, to immediately append to history file refer to the 'prompt'
    # function.

    # Disable /etc/bashrc_Apple_Terminal Bash sessions on Mac, it does not play
    # nice with normal bash history. Also, create a ~/.bash_sessions_disable
    # file to be double sure to disable Bash sessions.
    export SHELL_SESSION_HISTORY=0

    # Enable useful shell options:
    #  - autocd - change directory without no need to type 'cd' when changing directory
    #  - cdspell - automatically fix directory typos when changing directory
    #  - direxpand - automatically expand directory globs when completing
    #  - dirspell - automatically fix directory typos when completing
    #  - globstar - ** recursive glob
    #  - histappend - append to history, don't overwrite
    #  - histverify - expand, but don't automatically execute, history expansions
    #  - nocaseglob - case-insensitive globbing
    #  - no_empty_cmd_completion - do not TAB expand empty lines
    shopt -s autocd cdspell direxpand dirspell globstar histappend histverify \
        nocaseglob no_empty_cmd_completion

    # Prevent file overwrite on stdout redirection.
    # Use `>|` to force redirection to an existing file.
    set -o noclobber

    # Only logout if 'Control-d' is executed two consecutive times.
    export IGNOREEOF=1

    # Set preferred umask.
    umask 002

    # Disable Alacritty icon bouncing for interactive shells.
    # Refer to: https://is.gd/8MPdGh
    if [[ $- =~ i ]]; then
        printf "\e[?1042l"
    fi
}

user_paths() {
    if [[ $OS == "Linux" ]]; then
        # Note, in Linux /bin and /sbin now are symlinks to /usr equivalents.
        export PATH=~/binaries:~/scripts:/usr/local/bin:/usr/bin:/usr/sbin
    elif [[ $OS == "Darwin" ]]; then
        # However, in macOS /bin and /sbin are still distint.
        export PATH=~/binaries:~/scripts:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
    fi
    export MANPATH=/usr/local/man:/usr/local/share/man:/usr/man:/usr/share/man
}

web() {
    GOLD=$(tput setaf 222)
    GREEN=$(tput setaf 79)
    NC=$(tput sgr0)

    read -ep "$(echo -e "${GOLD}Search ${GREEN}➜ ${NC}")" search_term
    if [[ -n "$search_term" ]]; then
        open "https://search.brave.com/search?q=${search_term}" &>/dev/null
    fi
}


# Set environment.
#
user_paths
brew_config
prompt
custom_config
dev_config
shell_config
