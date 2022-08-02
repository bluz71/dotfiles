![dotfiles](https://raw.githubusercontent.com/bluz71/misc-binaries/master/headings/dotfiles.png)
==========

Contained are dotfiles for:

- Bash
- Readline
- Neovim
- Vim
- tmux
- Git
- SSH
- Linux fontconfig
- [markdownlint](https://github.com/DavidAnson/markdownlint)
- [bat](https://github.com/sharkdp/bat)
- [yamllint](https://github.com/adrienverge/yamllint)

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
