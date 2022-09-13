#!/bin/sh

git clone --depth 1 https://github.com/bluz71/bash-seafly-prompt ~/.bash-seafly-prompt

cd ~
ln -s dotfiles/bash_profile .bash_profile
ln -s dotfiles/bashrc       .bashrc
ln -s dotfiles/gitconfig    .gitconfig
ln -s dotfiles/gvimrc       .gvimrc
ln -s dotfiles/inputrc      .inputrc
ln -s dotfiles/irbrc        .irbrc
ln -s dotfiles/mdlrc        .mdlrc
ln -s dotfiles/pryrc        .pryrc
ln -s dotfiles/tmux.conf    .tmux.conf
ln -s dotfiles/vim/         .vim
ln -s dotfiles/vimrc        .vimrc

ln -s ~/dotfiles/nvim/       .config/nvim

mkdir -p .local/share/bash-completion
ln -s ~/dotfiles/completions .local/share/bash-completion

mkdir -p scripts
ln -s ~/dotfiles/git-bvv scripts/git-bvv

mkdir -p .config/yamllint
ln -s ~/dotfiles/yamllint .config/yamllint/config

mkdir -p .config/alacritty

if [ "$(uname)" = Linux ]; then
    mkdir -p .config/fontconfig
    ln -s ~/dotfiles/fonts.conf .config/fontconfig/fonts.conf
    ln -s ~/dotfiles/terminal_configs/Xresources .Xresources
    ln -s ~/dotfiles/terminal_configs/alacritty_linux.yml .config/alacritty/alacritty.yml
elif [  "$(uname)" = Darwin ]; then
    ln -s ~/dotfiles/terminal_configs/alacritty_macos.yml .config/alacritty/alacritty.yml
fi
