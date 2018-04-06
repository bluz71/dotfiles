#!/bin/sh

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
ln -s dotfiles/tern-project  .tern-project
ln -s dotfiles/tigrc         .tigrc
ln -s dotfiles/tmux.conf     .tmux.conf
ln -s dotfiles/vim/          .vim
ln -s dotfiles/vimrc         .vimrc

if [ "$(uname)" = Linux ]; then
    ln -s dotfiles/fonts.conf .fonts.conf
    ln -s dotfiles/Xresources .Xresources
fi
