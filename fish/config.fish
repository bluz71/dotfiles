# Disable Fish greeting.
set fish_greeting

# Start with a clean environment.
set -e PATH
set -e MANPATH

# Abbreviations
#
# -- Bang bang abbreviation
abbr !! --position anywhere --function last_history_item
# -- Parent directory expansion abbreviation
abbr ../ --position anywhere --function parent_directory
# -- Permissions abbreviations --
abbr 664 'chmod 664'
abbr 775 'chmod 775'
# -- Navigation abbreviations --
abbr -- - 'cd -'
abbr -- ~ 'cd ~'
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .... 'cd ../../..'
# -- Docker abbreviations --
abbr d docker
abbr dc docker-compose
# -- History abbreviations --
abbr h history
abbr hd 'history delete'
abbr hm 'history merge'
abbr ht history_truncate
# -- List abbreviations --
abbr l1 'eza --oneline'
abbr ll. 'll -d .*'
# -- tmux abbreviations --
abbr ta 'tmux attach'
abbr tls 'tmux ls'
# -- Miscellaneous abbreviations --
abbr be 'bundle exec'
abbr df. 'df -h .'
abbr ff fastfetch
abbr lynx 'lynx --accept_all_cookies'
abbr mdi meld
abbr p bat
abbr pn pnpm
abbr px pnpx
abbr --position anywhere rmrf 'rm -rf'
abbr --position anywhere rsync 'rsync -ahv --info=progress2'
abbr src '. ~/.config/fish/config.fish'
abbr wl 'wc -l'
abbr x exit

# General environment variables.
#
if test -z "$NVIM"
    set -gx EDITOR nvim
else
    # For Neovim lazygit edit and commit operations use neovim-remote.
    #
    # Note, install neovim-remote via:
    #   % pip3 install neovim-remote # Linux
    #   % pipx install neovim-remote # macOS
    set -gx EDITOR 'nvr --nostart --remote-tab-wait +"set bufhidden=delete"'
    # Use this when Neovim supports '--remote-tab-wait'
    # set -gx EDITOR 'nvim --server $NVIM --remote-tab-wait +"set bufhidden=delete"'
end
set -gx LESS '-F -Q -M -R -X -i -g -s -x4 -z-2'
set -gx LESS_TERMCAP_md \e'[00;34m'    # bold mode     - blue
set -gx LESS_TERMCAP_us \e'[00;32m'    # underline     - green
set -gx LESS_TERMCAP_so \e'[00;40;33m' # standout      - yellow on grey
set -gx LESS_TERMCAP_me \e'[0m'        # end bold      - reset
set -gx LESS_TERMCAP_ue \e'[0m'        # end underline - reset
set -gx LESS_TERMCAP_se \e'[0m'        # end standout  - reset
set -gx LESSHISTFILE -
# LS_COLORS (refer to: https://is.gd/6MzI27)
set -gx LS_COLORS "no=00:fi=00:di=38;5;111:ln=38;5;117:pi=38;5;43:bd=38;5;212:\
cd=38;5;219:or=30;48;5;203:ow=38;5;75:so=38;5;252;48;5;0:su=38;5;168:\
ex=38;5;156:mi=38;5;115:\
*.avi=38;2;175;215;175:*.mpg=38;2;175;215;175:*.mp4=38;2;244;180;180:\
*.epub=38;2;200;200;246:*.dsf=38;2;255;175;215:*.conf=38;2;95;215;175:\
*.md=38;2;213;218;180:*README=38;2;213;218;180:\
*.pdf=38;2;218;218;218"
# EZA_COLORS (refer to: man eza_colors)
set -gx EZA_COLORS "da=38;5;252:sb=38;5;204:sn=38;5;43:xa=8:\
uu=38;5;245:un=38;5;241:ur=38;5;223:uw=38;5;223:ux=38;5;223:ue=38;5;223:\
gr=38;5;153:gw=38;5;153:gx=38;5;153:tr=38;5;175:tw=38;5;175:tx=38;5;175:\
gm=38;5;203:ga=38;5;203:mp=3;38;5;111:im=38;2;180;150;250:vi=38;2;255;190;148:\
mu=38;2;255;175;215:lo=38;2;255;215;183:cr=38;2;240;160;240:\
do=38;2;200;200;246:co=38;2;255;119;153:tm=38;2;148;148;148:\
cm=38;2;230;150;210:bu=38;2;95;215;175:sc=38;2;120;220;200"
set -gx PAGER less
set -gx MANPAGER 'nvim +Man!'

# What platform are we running on.
set -gx OS (uname)

if test $OS = Linux
    set -gx SHELL /bin/fish
    if test -f /etc/arch-release
        set -gx OS_NAME Arch
    else if test -f /etc/debian_version
        set -gx OS_NAME Debian
    end
    abbr dr14_tmeter '/usr/local/dr14_t.meter/dr14_tmeter'
    abbr free 'free -th'
    abbr nmshow 'nmcli connection show'
    abbr updatedb 'sudo /usr/bin/updatedb'
    abbr wg0down 'nmcli connection down wg0'
    abbr wg0info 'nmcli --overview connection show wg0'
    abbr wg0up 'nmcli connection up wg0'
else if test $OS = Darwin
    set -gx SHELL /opt/homebrew/bin/fish
    set -gx OS_NAME macOS
    set -gx PGGSSENCMODE disable # Reference: https://is.gd/flzYH7
    abbr locate 'mdfind -name'
end

# Functions.
#
function brew_config
    if test $OS = Linux; and test $OS_NAME = Debian
        if not command -v /home/linuxbrew/.linuxbrew/bin/brew &>/dev/null; or not test -x (command -v /home/linuxbrew/.linuxbrew/bin/brew &>/dev/null)
            echo 'Note: brew is not available.'
            return
        end
        set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
        set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
        set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"
        fish_add_path --path $HOMEBREW_PREFIX/bin
        set -gx MANPATH $HOMEBREW_PREFIX/share/man $MANPATH
        set -gx HOMEBREW_NO_AUTO_UPDATE 1
    else if test $OS = Darwin
        if not command -v /opt/homebrew/bin/brew &>/dev/null; or not test -x (command -v /opt/homebrew/bin/brew &>/dev/null)
            echo 'Note: brew is not available'
            return
        end
        set -gx HOMEBREW_PREFIX /opt/homebrew
        set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
        set -gx HOMEBREW_REPOSITORY /opt/homebrew
        fish_add_path --path $HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin
        fish_add_path --path $HOMEBREW_PREFIX/opt/gnu-tar/libexec/gnubin
        fish_add_path --path $HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin
        fish_add_path --path $HOMEBREW_PREFIX/bin
        set -gx MANPATH $HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman $HOMEBREW_PREFIX/share/man $MANPATH
        set -gx HOMEBREW_NO_AUTO_UPDATE 1
    else if test $OS_NAME = Arch
        return
    else
        echo 'Error: unsupported platform'
        return
    end
end

function custom_config
    # Manually load Fish completions from Homebrew on Debian systems.
    #
    # Note, this is not needed on macOS because we are using Homebrew's Fish.
    # On Debian we are using the system Fish, hence the need for this sourcing.
    if test $OS_NAME = Debian; and test -d $HOMEBREW_PREFIX/share/fish/vendor_completions.d
        set -p fish_complete_path $HOMEBREW_PREFIX/share/fish/vendor_completions.d
    end

    # 'fzf' configuration.
    test -n "$HOMEBREW_PREFIX"; and . $HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.fish
    # Note, Arch Linux automatically sources the fzf_key_bindings.fish file.
    set -xg FZF_DEFAULT_OPTS '
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
      --preview 'eza --no-quotes --color=always --color-scale-mode=fixed --group-directories-first --oneline {2..}'
    "

    # 'bat' configuration.
    set -xg BAT_CONFIG_PATH "$HOME/dotfiles/bat.conf"
end

function dev_config
    if test -f "$HOMEBREW_PREFIX/share/chruby/chruby.sh"
        # chruby is slow, instead simply set environment variables explicitly.
        #   . $HOMEBREW_PREFIX/share/chruby/chruby.sh
        #   chruby 3.3.9
        set -gx RUBY_VERSION 3.3.9
        set -gx RUBY_ROOT $HOME/.rubies/ruby-$RUBY_VERSION
        set -gx GEM_ROOT $RUBY_ROOT/lib/ruby/gems/3.3.0
        set -gx GEM_HOME $HOME/.gem/ruby/$RUBY_VERSION
        set -gx GEM_PATH $GEM_HOME $GEM_ROOT
        fish_add_path --path $GEM_HOME/bin $RUBY_ROOT/bin
    end

    if test -x "$HOMEBREW_PREFIX/bin/fnm"
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
end

function shell_config
    # Fish has been initialized.
    set -g __fish_initialized 3400

    # Use Emacs-style key bindings.
    set -g fish_key_bindings fish_default_key_bindings

    # Set preferred umask.
    umask 002

    # Disable Alacritty icon bouncing for interactive shells.
    # Refer to: https://is.gd/8MPdGh
    if status is-interactive
        printf "\e[?1042l"
    end
end

function style_config
    if not status is-interactive
        return
    end

    # Syntax highlighting colors.
    set -g fish_color_autosuggestion 626262
    set -g fish_color_cancel 626262
    set -g fish_color_command 7cb3ff
    set -g fish_color_comment 949494 --italics
    set -g fish_color_cwd 87d787
    set -g fish_color_cwd_root ff5189
    set -g fish_color_end 949494
    set -g fish_color_error ff5d5d
    set -g fish_color_escape 949494
    set -g fish_color_history_current c6c6c6 --background=323437
    set -g fish_color_host e4e4e4
    set -g fish_color_host_remote e4e4e4
    set -g fish_color_keyword cf87e8
    set -g fish_color_match c6c6c6 --background=323437
    set -g fish_color_normal bdbdbd
    set -g fish_color_operator e65e72
    set -g fish_color_option bdbdbd
    set -g fish_color_param 61d5ae
    set -g fish_color_quote c6c684
    set -g fish_color_redirection 8cc85f
    set -g fish_color_search_match --background=323437
    set -g fish_color_selection --background=323437
    set -g fish_color_status ff5d5d
    set -g fish_color_user 36c692
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
    if test $OS = Linux
        set -gx PATH ~/binaries ~/scripts /usr/local/bin /usr/bin /usr/sbin
    else if test $OS = Darwin
        set -gx PATH ~/binaries ~/scripts /usr/local/bin /usr/bin /bin /usr/sbin /sbin
    end
    set -gx PATH ~/binaries ~/scripts /usr/local/bin /usr/bin /usr/sbin
    set -gx MANPATH /usr/local/man /usr/local/share/man /usr/man /usr/share/man
end


# Set environment.
#
user_paths
brew_config
custom_config
dev_config
shell_config
style_config
