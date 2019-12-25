![dotfiles](https://github.com/bluz71/misc-binaries/blob/master/headings/dotfiles.png)
==========

Contained are dotfiles for:

- Bash
- Readline
- Vim / Neovim
- tmux
- Git
- Ruby _irb_ and _pry_ REPL
- SSH
- xterm (via Xresources)
- Linux fontconfig
- [markdownlint](https://github.com/DavidAnson/markdownlint)
- [bat](https://github.com/sharkdp/bat)
- [yamllint](https://github.com/adrienverge/yamllint)

Platforms where these dotfiles are used: macOS with Homebrew and Debian
derivatives of Linux (Linux Mint and Ubuntu).

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
