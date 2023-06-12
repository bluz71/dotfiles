# Disable Fish greeting.
set fish_greeting ""

# Start with a clean environment.
set -e PATH
set -e MANPATH

# Aliases and abbreviations.
#
# -- Coreutils aliases --
alias cp '/bin/cp -iv'
alias mv '/bin/mv -iv'
alias rm '/bin/rm -i'
alias rmrf '/bin/rm -rf'
# -- Permissions aliases --
abbr 664 'chmod 664'
abbr 775 'chmod 775'
# -- Navigation aliases --
abbr -- - 'cd -'
abbr -- ~ 'cd ~'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias cf fzf_change_directory
# -- Disk aliases --
alias df. 'df -h .'
alias du 'du -b'
alias dus du_by_size
# -- Docker aliases --
alias d docker
alias dc docker-compose
# -- Git aliases --
alias g~ 'cd "$(git rev-parse --show-toplevel)"'
alias ga fzf_git_add
alias gll 'fzf_git_log clean'
alias glla 'fzf_git_log all'
alias glS fzf_git_log_pickaxe
alias grl fzf_git_reflog
alias gu fzf_git_unadd
# -- History aliases --
alias h=history
alias hg='history | rg'
# TODO alias ht='history_truncate' Fish history file: ~/.local/share/fish/fish_history
# -- List aliases --
alias dir='ls -l --group-directories-first'
alias l 'exa --color=always --group-directories-first'
alias l1 'l --oneline'
alias l1d 'l1 --list-dirs'
alias ll 'l --long'
alias ll. 'll -d .*'
alias lld 'll --list-dirs'
abbr llfs find_by_size
# -- ripgrep aliases --
alias rg 'rg --smart-case'
# -- Tree aliases --
alias t 'tree -C --dirsfirst'
alias td 'tree -C -d'
alias tdl 'tree -C -d -L'
alias tl 'tree -C --dirsfirst -L'
# -- Tree aliases --
alias mux mux_command
alias ta 'tmux attach'
alias tls 'tmux ls'
alias tnew 'tmux new -s $(basename $(pwd) | cut -d"." -f1)'
# -- Vim aliases --
alias gv 'gvim 2> /dev/null'
alias v nvim
alias vdi 'nvim -d'
alias vf fzf_find_edit
alias vg grep_edit
# -- Miscellaneous aliases --
alias be 'bundle exec'
alias bs 'br --whale-spotting'
alias cwd copy_working_directory
alias eq math
alias fkill fzf_kill
alias lynx 'lynx --accept_all_cookies'
alias m less
alias mdi 'meld 2>/dev/null'
alias p bat
alias pn pnpm
alias px pnpx
alias pping 'prettyping --nolegend -i 5'
alias psu 'ps -u $USER -f'
alias qmv 'qmv -d -f do'
alias rs 'rsync --archive --human-readable --info=progress2 --verbose'
alias src '. ~/.config/fish/config.fish'
alias sudo 'sudo '
alias wl 'wc -l'
alias x exit
alias ytest 'CI=true yarn test --colors'
# TODO abbr -- ? 'navi_cheats'

# General environment variables.
#
set -gx EDITOR nvim
set -gx LESS '-F -Q -M -R -X -i -g -s -x4 -z-2'
set -gx LESS_TERMCAP_md \e'[00;34m' # bold mode     - blue
set -gx LESS_TERMCAP_us \e'[00;32m' # underline     - green
set -gx LESS_TERMCAP_so \e'[00;40;33m' # standout      - yellow on grey
set -gx LESS_TERMCAP_me \e'[0m' # end bold      - reset
set -gx LESS_TERMCAP_ue \e'[0m' # end underline - reset
set -gx LESS_TERMCAP_se \e'[0m' # end standout  - reset
set -gx LESSHISTFILE -
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
set -gx LS_COLORS "no=00:fi=00:di=38;5;111:ln=38;5;117:pi=38;5;43:bd=38;5;212:\
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
set -gx EXA_COLORS "reset:da=38;5;252:sb=38;5;204:sn=38;5;43:\
uu=38;5;245:un=38;5;241:ur=38;5;223:uw=38;5;223:ux=38;5;223:ue=38;5;223:\
gr=38;5;153:gw=38;5;153:gx=38;5;153:tr=38;5;175:tw=38;5;175:tx=38;5;175:\
gm=38;5;203:ga=38;5;203:xa=38;5;239"
set -gx PAGER less

# What platform are we running on.
set -gx OS (uname)

if test $OS = Linux
    set -g SHELL "/home/linuxbrew/.linuxbrew/bin/fish"
    alias ip 'ip --color=auto'
    alias cpa '/bin/cp -i -a'
    alias dr14_tmeter '/usr/local/dr14_t.meter/dr14_tmeter'
    alias free 'free -th'
    alias ls 'ls --color --classify --human-readable --quoting-style=escape'
    alias mplayer 'mplayer $argv 2>/dev/null'
    alias nmshow 'nmcli connection show'
    alias open 'xdg-open 2>/dev/null'
    alias scp '/usr/bin/scp -r'
    alias ssh /usr/bin/ssh
    alias ssh-add /usr/bin/ssh-add
    alias updatedb 'sudo /usr/bin/updatedb'
    alias wg0down 'nmcli connection down wg0'
    alias wg0info 'nmcli --overview connection show wg0'
    alias wg0up 'nmcli connection up wg0'
else if test $OS = Darwin
    set -g SHELL /opt/homebrew/bin/fish
    alias cpa '/opt/homebrew/bin/gcp -i -a'
    alias ls 'ls --color --classify --human-readable --quoting-style=escape'
    alias scp '/opt/homebrew/bin/scp -r'
    alias ssh /opt/homebrew/bin/ssh
    alias ssh-add /opt/homebrew/bin/ssh-add
    alias updatedb 'env PATH=/usr/bin $PATH sudo /usr/libexec/locate.updatedb'
end

# Functions.
#
function brew_config
    if test $OS = Linux
        if not test -x (command -v /home/linuxbrew/.linuxbrew/bin/brew)
            echo 'Note: brew is not installed.'
            return
        end
        set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
        set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
        set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"
        fish_add_path --path $HOMEBREW_PREFIX/bin
        set -gx MANPATH $HOMEBREW_PREFIX/share/man $MANPATH
    else if test $OS = Darwin
        if not test -x (command -v /opt/homebrew/bin/brew)
            echo 'Note: brew is not installed.'
            return
        end
        set -gx HOMEBREW_PREFIX /opt/homebrew
        set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
        set -gx HOMEBREW_REPOSITORY /opt/homebrew
        fish_add_path --path $HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin
        fish_add_path --path $HOMEBREW_PREFIX/opt/gnu-tar/libexec/gnubin
        fish_add_path --path $HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin
        fish_add_path --path $HOMEBREW_PREFIX/bin
        set -g MANPATH $HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman $HOMEBREW_PREFIX/share/man $MANPATH
    else
        echo 'Error: unsupported platform'
        return
    end
end

function copy_working_directory
    if test $OS = Linux
        echo -n (echo $PWD | sed "s|^$HOME|~|") | tr -d "\r\n" | xclip -selection clipboard -i
    else if test $OS = Darwin
        echo -n (echo $PWD | sed "s|^$HOME|~|") | tr -d "\r\n" | pbcopy
    end
    # Also copy current directory to a tmux paste buffer if tmux is active.
    if test -n $TMUX
        echo -n (echo $PWD | sed "s|^$HOME|~|") | tr -d "\r\n" | tmux load-buffer -
    end
end

function custom_config
    if test -z $HOMEBREW_PREFIX
        return
    end

    # TODO 'broot' function.
    # . ~/dotfiles/profile.d/br.sh

    # 'fzf' configuration.
    . $HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.fish
    set -xg FZF_DEFAULT_OPTS '
      --height 75% --multi --reverse --margin=0,1
      --bind ctrl-f:page-down,ctrl-b:page-up
      --bind pgdn:preview-page-down,pgup:preview-page-up
      --marker="✚" --pointer="▶" --prompt="❯ "
      --no-separator --scrollbar="█" --border
      --color bg+:#262626,fg+:#dadada,hl:#f09479,hl+:#f09479
      --color border:#303030,info:#cfcfb0,header:#80a0ff,spinner:#36c692
      --color prompt:#87afff,pointer:#ff5189,marker:#f09479
    '
    set -xg FZF_DEFAULT_COMMAND 'fd --type f --color=never'
    set -xg FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
    set -xg FZF_CTRL_T_OPTS '--preview "bat --color=always --line-range :500 {}"'
    set -xg FZF_ALT_C_COMMAND 'fd --type d . --color=never'
    set -xg FZF_ALT_C_OPTS '--preview "tree -C {} | head -100"'

    # 'zoxide' utility.
    zoxide init fish | source
    set -xg _ZO_EXCLUDE_DIRS $HOME $HOME/Music/*
    set -xg _ZO_MAXAGE 20000
    set -xg _ZO_FZF_OPTS "
      $FZF_DEFAULT_OPTS --no-multi --no-sort --exit-0 --select-1
      --preview 'exa --color=always --group-directories-first --oneline {2..}'
    "

    # 'bat' configuration.
    set -xg BAT_CONFIG_PATH "$HOME/dotfiles/bat.conf"
end

function dev_config
    if test -z $HOMEBREW_PREFIX
        return
    end

    if test -f $HOMEBREW_PREFIX/share/chruby/chruby.sh
        # chruby is slow, instead simply set environment variables explicitly.
        #   . $HOMEBREW_PREFIX/share/chruby/chruby.sh
        #   chruby 3.2.1
        set -gx RUBY_VERSION 3.2.1
        set -gx RUBY_ROOT $HOME/.rubies/ruby-$RUBY_VERSION
        set -gx GEM_ROOT $RUBY_ROOT/lib/ruby/gems/3.2.0
        set -gx GEM_HOME $HOME/.gem/ruby/$RUBY_VERSION
        set -gx GEM_PATH $GEM_HOME $GEM_ROOT
        fish_add_path --path $GEM_HOME/bin $RUBY_ROOT/bin
    end

    if test -x $HOMEBREW_PREFIX/bin/fnm
        fnm env | source
        set -gx PNPM_HOME $HOME/.local/share/pnpm
        fish_add_path --path --append $PNPM_HOME
    end

    if test -x ~/.cargo/bin
        fish_add_path --path --append ~/.cargo/bin
    end

    if test -d ~/projects/go
        set -gx GOPATH ~/projects/go
        fish_add_path --path --append $GOPATH/bin
    end

    if test -d /usr/local/Android/Sdk
        set -gx ANDROID_SDK_ROOT /usr/local/Android/Sdk
        fish_add_path --path --append $PATH $ANDROID_SDK_ROOT/emulator
    else if test -d ~/Library/Android/Sdk
        set -gx ANDROID_SDK_ROOT ~/Library/Android/Sdk
        fish_add_path --path --append $ANDROID_SDK_ROOT/emulator
    end

    if test -d /usr/local/flutter/bin
        fish_add_path --path --append /usr/local/flutter/bin
        set -gx DART_SDK /usr/local/flutter/bin/cache/dart-sdk
        fish_add_path --path --append $DART_SDK/bin
    end
end

function du_by_size
    if test (count $argv) -eq 0
        du -sh * | sort -hr | less
    else
        du -sh $argv | sort -hr | less
    end
end

function find_by_size
    if test (count $argv) -eq 0
        echo "Usage: llfs <size> (e.g. 100k, +1M, +1G)"
    else
        find . -type f -size $argv -exec exa --long {} \;
    end
end

function fish_user_key_bindings
    # Need to define Shift-Left & Shift-Right as follows for BIG word navigation
    # to work in tmux.
    bind \e\[1\;2D backward-bigword
    bind \e\[1\;2C forward-bigword
end

function fzf_change_directory
    set -f directory (
      fd --type d |
        fzf --query="$argv" --no-multi --select-1 --exit-0 \
            --preview 'tree -C {} | head -100'
      )
    if test -n "$directory"
        cd "$directory"
    end
end

function fzf_find_edit
    set -f file (
      fzf --query="$argv" --no-multi --select-1 --exit-0 \
          --preview 'bat --color=always --line-range :500 {}'
      )
    if test -n "$file"
        $EDITOR "$file"
    end
end

function fzf_git_add
    set -f selections (
      git status --porcelain | \
        fzf --ansi \
            --preview 'if git ls-files --error-unmatch {2} &>/dev/null
                         git diff --color=always {2} | delta
                       else
                         bat --color=always --line-range :500 {2}
                       end'
    )
    if test -n "$selections"
        set -l files (echo "$selections" | cut -c 4- | tr '\n' ' ')
        echo "$files"
    end
end

function fzf_git_log
    set -f command ll
    if test "$1" = all
        set -f command lla
    end
    set -e argv[1] # Consume the first argument of this function
    set -f selection (
      git $command --color=always $argv | \
        fzf --no-multi --ansi --no-sort --no-height \
            --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 |
                       xargs -I@ sh -c 'git show --color=always @' |
                       delta"
      )
    if test -n "$selection"
        set -l commit (echo "$selection" | sed 's/^[* |]*//' | awk '{print $1}' | tr -d '\n')
        git show $commit
    end
end

function fzf_git_log_pickaxe
    if test (count $argv) -eq 0
        echo 'Usage: glS <search-term>'
        return
    end
    set -f selections (
      git log --oneline --color=always -S $argv | \
        fzf --ansi --no-sort --no-height \
            --preview 'git show --color=always {1} | delta'
    )
    if test -n "$selections"
        set -l commits (echo "$selections" | awk '{print $1}' | tr -d '\n')
        git show $commits
    end
end

function fzf_git_reflog
    set -f selection (
      git reflog --color=always $argv | \
        fzf --no-multi --ansi --no-sort --no-height \
            --preview 'git show --color=always {1} | delta'
    )
    if test -n "$selection"
        git show (echo $selection | awk '{print $1}')
    end
end

function fzf_git_unadd
    set -f files (git diff --name-only --cached | fzf --ansi)
    if test -n "$files"
        git unadd "$files"
    end
end

function fzf_kill
    if test $OS = Linux
        set -f pids (ps -f -u $USER | sed 1d | fzf | awk '{print $2}')
    else if test $OS = Darwin
        set -f pids (ps -f -u $USER | sed 1d | fzf | awk '{print $3}')
    else
        echo 'Error: unknown platform.'
        return
    end
    echo $pids
    if test -n "$pids"
        echo "$pids" | xargs kill -9 $argv
    end
end

function g --wraps git
    if test (count $argv) -eq 0
        git status -sb
    else
        git $argv
    end
end

function grep_edit
    if test (count $argv) -eq 0
        echo 'Usage: vg <search-term>'
        return
    end

    $EDITOR (rg -l $argv)
end

function lc
    ls $argv | wc -l
end

function lldt
    ll -r --sort=modified --list-dirs $argv | less
end

function lls
    ll -r --sort=size $argv | less
end

function llt
    ll -r --sort=modified $argv | less
end

function mc
    mkdir -p $argv && cd $argv
end

function mux_command
    if test (count $argv) -eq 1 -a $argv[1] = stop
        # Automatically stop the current session.
        tmuxinator stop (tmux display-message -p '#S')
    else
        tmuxinator $argv
    end
end

function shell_config
    # Fish has been initialized.
    set -g __fish_initialized 3400

    # Use Emacs-style key bindings.
    set -g fish_key_bindings fish_default_key_bindings
end

function style
    if not status is-interactive
        return
    end

    # Refer to: https://fishshell.com/docs/current/interactive.html#syntax-highlighting

    # Syntax highlighting colors.
    set -g fish_color_autosuggestion 626262
    set -g fish_color_cancel 626262
    set -g fish_color_command 7cb3ff
    set -g fish_color_comment 949494 --italics
    set -g fish_color_cwd 87d787
    set -g fish_color_cwd_root ff5189
    set -g fish_color_end 949494
    set -g fish_color_error ff5454
    set -g fish_color_escape 949494
    set -g fish_color_history_current c6c6c6 --background=323437
    set -g fish_color_host e4e4e4
    set -g fish_color_host_remote e4e4e4
    set -g fish_color_keyword cf87e8
    set -g fish_color_match c6c6c6 --background=323437
    set -g fish_color_normal bdbdbd
    set -g fish_color_operator e65e72
    set -g fish_color_option bdbdbd
    set -g fish_color_param e196a2
    set -g fish_color_quote c2c292
    set -g fish_color_redirection 8cc85f
    set -g fish_color_search_match --background=323437
    set -g fish_color_selection --background=323437
    set -g fish_color_status ff5454
    set -g fish_color_user 87d7af
    set -g fish_color_valid_path

    # Completion pager colors.
    set -g fish_pager_color_completion c6c6c6
    set -g fish_pager_color_description 949494
    set -g fish_pager_color_prefix 74b2ff
    set -g fish_pager_color_progress 949494
    set -g fish_pager_color_selected_background --background=323437
    set -g fish_pager_color_selected_completion e4e4e4
    set -g fish_pager_color_selected_description e4e4e4
end

function user_paths
    fish_add_path --path /usr/local/bin /bin /usr/bin /sbin /usr/sbin
    fish_add_path --path ~/binaries ~/scripts
    set -gx MANPATH /usr/local/man /usr/local/share/man /usr/man /usr/share/man
end

function web
    read -p 'set_color ffd787;
             echo -n "Search ";
             set_color 5fd7af;
             echo -n "➜ ";
             set_color normal' search_term
    if test -n "$search_term"
        open "https://duckduckgo.com/?q=$search_term" >/dev/null 2>&1
    end
end

# Set environment.
#
user_paths
brew_config
custom_config
dev_config
shell_config
style
