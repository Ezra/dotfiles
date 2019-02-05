#!/bin/zsh
#remark: probably needs update

cp tmux.conf $HOME/.tmux.conf
cp -n tmux.conf.local $HOME/.tmux.conf.local

cp zshrc.zsh $HOME/.zshrc
cp -n zshrc.local.zsh $HOME/.zshrc.local
mkdir -p $HOME/.zsh
cp -r zsh/* $HOME/.zsh

#cp bash_profile $HOME/.bash_profile

#cp emacs $HOME/.emacs

#cp pdbrc $HOME/.pdbrc

cp vimrc $HOME/.vimrc
cp -n vimrc.local.vim $HOME/.vimrc.local
#mkdir -p $HOME/.vim
#cp -r vim/* $HOME/.vim

tmux source-file $HOME/.tmux.conf
source $HOME/.zshrc
