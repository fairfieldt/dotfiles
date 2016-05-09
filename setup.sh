#!/usr/bin/env bash

fail() {
	echo $1
	exit 1
}

SRC_DIR=`pwd`
OS=`uname`
#dev folders
mkdir -p "$HOME/dev"

#git
[[ `which git` ]] || fail "You should install git"

#git setup
git config --global user.name "Tom Fairfield"
git config --global user.email "fairfield@cs.xu.edu"
git config --global color.ui auto
git config --global core.editor vim

#vim backup folders
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swap

#vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#vimrc
ln -s $SRC_DIR/vimrc ~/.vimrc

#bashrc
mv ~/.bashrc ~/.bashrc.bak
ln -s $SRC_DIR/bashrc ~/.bashrc

#tmux.conf
ln -s $SRC_DIR/tmux.conf ~/.tmux.conf

vim +PluginInstall +qall
