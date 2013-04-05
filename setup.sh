#!/bin/bash

fail() {
	echo $1
	exit 1
}

SRC_DIR=`pwd`
OS=`uname`
#dev folders
mkdir -p ~/dev/gameclosure

#git
[[ `which git` ]] || fail "You should install git"

#node
[[ `which node` ]] || fail "You should install node"


#git setup
git config --global user.name "Tom Fairfield"
git config --global user.email "fairfieldt@gameclosure.com"
git config --global color.ui auto
git config --global core.editor vim

#pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

#nerdtree
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git


#syntastic
cd ~/.vim/bundle
git clone https://github.com/scrooloose/syntastic.git

#ctrlp
cd ~/.vim/bundle
git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim


#vim-slime
cd ~/.vim/bundle
git clone git://github.com/jpalardy/vim-slime.git

#fugitive
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-fugitive.git

#haskell
cd ~/.vim/bundle
git clone https://github.com/wlangstroth/vim-haskell.git


#clojure
cd ~/.vim/bundle
git clone https://github.com/vim-scripts/VimClojure.git

#supertab
cd ~/.vim/bundle
git clone https://github.com/ervandew/supertab.git

#cscope
cd ~/.vim/bundle
git clone https://github.com/chazy/cscope_maps.git

#clang-complete
cd ~/.vim/bundle
git clone https://github.com/Rip-Rip/clang_complete.git

#ultisnips (textmate style snippets)
cd ~/.vim/bundle
git clone https://github.com/vim-scripts/UltiSnips.git

#vim backup folders
mkdir -p ~/.vim/backup
mkdir -p ~/vim/swap

#vimrc
ln -s $SRC_DIR/vimrc ~/.vimrc

#bashrc
ln -s $SRC_DIR/bashrc ~/.bashrc
