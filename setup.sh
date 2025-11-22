#!/bin/sh

git clone --depth 1 https://github.com/bluz71/bash-seafly-prompt ~/.bash-seafly-prompt

cd ~
ln -s dotfiles/bash_profile .bash_profile
if [ -e .bashrc ]; then
    mv .bashrc .bashrc.bak
fi
ln -s dotfiles/bashrc .bashrc
ln -s dotfiles/gitconfig .gitconfig
ln -s dotfiles/gvimrc .gvimrc
ln -s dotfiles/inputrc .inputrc
ln -s dotfiles/pryrc .pryrc
ln -s dotfiles/tmux.conf .tmux.conf
ln -s dotfiles/vim/ .vim
ln -s dotfiles/vimrc .vimrc

ln -s ~/dotfiles/nvim/ .config/nvim

mkdir -p .local/share/bash-completion
ln -s ~/dotfiles/completions .local/share/bash-completion

ln -s ~/dotfiles/fish/ .config/fish

mkdir -p scripts
ln -s ~/dotfiles/git-bvv scripts/git-bvv
ln -s ~/dotfiles/git-vdiff scripts/git-vdiff

ln -s dotfiles/linter_configs/mdlrc .mdlrc

mkdir -p .config/yamllint
ln -s ~/dotfiles/linter_configs/yamllint .config/yamllint/config

mkdir -p .config/navi
ln -s ~/dotfiles/misc/navi.yaml .config/navi/config.yaml

mkdir -p .config/alacritty

if [ "$(uname)" = Linux ]; then
    mkdir -p .config/fontconfig
    ln -s ~/dotfiles/misc/fonts.conf .config/fontconfig/fonts.conf

    ln -s ~/dotfiles/terminal_configs/Xresources .Xresources
    ln -s ~/dotfiles/terminal_configs/alacritty_linux.toml .config/alacritty/alacritty.toml

    mkdir -p .config/lazygit
    ln -s ~/dotfiles/lazygit/config.yml .config/lazygit/config.yml

    mkdir -p .config/rofi
    ln -s ~/dotfiles/misc/config.rasi .config/rofi/config.rasi
elif [  "$(uname)" = Darwin ]; then
    ln -s ~/dotfiles/terminal_configs/alacritty_macos.toml .config/alacritty/alacritty.toml
    mkdir -p Library/Application\ Support/lazygit
    ln -s ~/dotfiles/lazygit/config.yml Library/Application\ Support/lazygit/config.yml
fi
