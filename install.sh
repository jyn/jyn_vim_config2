#!/usr/bin/env bash

cd ~
mkdir .vimconfig
cd .vimconfig

git clone https://github.com/jyn/jyn_vim_config2.git
ln -s ~/.vimconfig/jyn_vim_config2 ~/.vim
ln -s ~/.vimconfig/jyn_vim_config2/.vimrc ~/.vimrc

git clone https://github.com/jyn/snipmate-snippets.git
ln -s ~/.vimconfig/snipmate-snippets ~/.vim/snippets

git clone https://github.com/jyn/vim-colorschemes.git
ln -s ~/.vimconfig/vim-colorschemes/colors ~/.vim/colors

cd
