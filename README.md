![dotfiles](https://raw.githubusercontent.com/bluz71/misc-binaries/master/headings/dotfiles.png)
==========

Contained are dotfiles for:

- [Bash](https://github.com/bluz71/dotfiles/blob/master/bashrc)
- [Readline](https://github.com/bluz71/dotfiles/blob/master/inputrc)
- [Fish](https://github.com/bluz71/dotfiles/tree/master/fish)
- [Neovim](https://github.com/bluz71/dotfiles/tree/master/nvim)
- [Vim](https://github.com/bluz71/dotfiles/blob/master/vimrc)
- [tmux](https://github.com/bluz71/dotfiles/blob/master/tmux.conf)
- [Git](https://github.com/bluz71/dotfiles/blob/master/gitconfig)

Platforms where these dotfiles are used: macOS with Homebrew and Debian
derivatives of Linux (Linux Mint and Ubuntu).

Screenshot
----------

![terminal](https://raw.githubusercontent.com/bluz71/misc-binaries/master/misc/dotfiles.png)

Installation
------------

```sh
% cd ~
% git clone https://github.com:bluz71/dotfiles.git
% ~/dotfiles/setup.sh
```

Run `ssh` to create its dot directory then do:

```sh
cp ~/dotfiles/ssh_config ~/.ssh/config
```

License
-------

[![License: Unlicense](https://img.shields.io/badge/License-Unlicense-blue.svg)](https://unlicense.org/)
