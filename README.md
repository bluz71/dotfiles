User configuration files
========================

Contained are dotfiles for:

* Bash
* Readline
* Git
* Vim / Neovim
* Ruby *irb* and *pry* REPL
* Elixir *iex* REPL
* SSH
* tmux
* xterm (via Xresources)
* Linux fontconfig

Platforms where these dotfiles are used: macOS with Homebrew and Debian
derivatives of Linux (Linux Mint and Ubuntu).

Installation
------------

```sh
% cd ~
% git clone https://github.com:bluz71/dotfiles.git
% ~/dotfiles/setup.sh
```

Run Neovim and SSH to create the base directories for both utilities then do:

```sh
ln dotfiles/init.vim      .config/nvim/init.vim
cp dotfiles/ssh_config    .ssh/config
```
