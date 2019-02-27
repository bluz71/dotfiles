# User dotfiles

Contained are dotfiles for:

-   Bash
-   Readline
-   Git
-   Vim / Neovim
-   Ruby _irb_ and _pry_ REPL
-   Elixir _iex_ REPL
-   SSH
-   tmux
-   xterm (via Xresources)
-   Linux fontconfig
-   JavaScript _eslint_ and _tern_

Platforms where these dotfiles are used: macOS with Homebrew and Debian
derivatives of Linux (Linux Mint and Ubuntu).

## Installation

```sh
% cd ~
% git clone https://github.com:bluz71/dotfiles.git
% ~/dotfiles/setup.sh
```

Run Neovim and SSH to create their dot directories then do:

```sh
ln -s dotfiles/init.vim .config/nvim/init.vim
cp dotfiles/ssh_config .ssh/config
```
