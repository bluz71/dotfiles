#!/bin/sh

git clone --depth 1 https://github.com/bluz71/bash-seafly-prompt ~/.bash-seafly-prompt

cd ~
ln -s dotfiles/bash_profile  .bash_profile
ln -s dotfiles/bashrc        .bashrc
ln -s dotfiles/eslintrc.yml  .eslintrc.yml
ln -s dotfiles/gitconfig     .gitconfig
ln -s dotfiles/gvimrc        .gvimrc
ln -s dotfiles/iex.exs       .iex.exs
ln -s dotfiles/inputrc       .inputrc
ln -s dotfiles/irbrc         .irbrc
ln -s dotfiles/mdlrc         .mdlrc
ln -s dotfiles/pryrc         .pryrc
ln -s dotfiles/tmux.conf     .tmux.conf
ln -s dotfiles/vim/          .vim
ln -s dotfiles/vimrc         .vimrc

mkdir -p .config/nvim
ln -s ~/dotfiles/init.vim .config/nvim/init.vim

mkdir -p scripts
ln -s ~/dotfiles/git-bvv scripts/git-bvv

if [ "$(uname)" = Linux ]; then
    mkdir -p .config/fontconfig
    ln -s ~/dotfiles/fonts.conf .config/fontconfig/fonts.conf
    ln -s dotfiles/Xresources .Xresources
fi
