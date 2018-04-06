#!/bin/sh

cd ~
ln dotfiles/bash_profile  .bash_profile
ln dotfiles/bashrc        .bashrc
ln dotfiles/eslintrc.yml  .eslintrc.yml
ln dotfiles/gitconfig     .gitconfig
ln dotfiles/gvimrc        .gvimrc
ln dotfiles/iex.exs       .iex.exs
ln dotfiles/inputrc       .inputrc
ln dotfiles/irbrc         .irbrc
ln dotfiles/mdlrc         .mdlrc
ln dotfiles/pryrc         .pryrc
ln dotfiles/tern-project  .tern-project
ln dotfiles/tigrc         .tigrc
ln dotfiles/tmux.conf     .tmux.conf
ln dotfiles/vim/          .vim
ln dotfiles/vimrc         .vimrc

if [ "$(uname)" = Linux ]; then
    ln dotfiles/fonts.conf .fonts.conf
    ln dotfiles/Xresources .Xresources
fi
