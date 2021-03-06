#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y \
    fontconfig \
    python \
    python-pip \
    vim \
    tmux

sudo pip install -r requirements.txt

sudo cp PowerlineSymbols.otf /usr/local/share/fonts/
sudo cp 10-powerline-symbols.conf /etc/fonts/conf.d/
sudo fc-cache -vf

DOTFILES=".bashrc .vimrc .tmux.conf .gdbinit"

git submodule init
git submodule update

for i in $DOTFILES; do
    $(cp -r $i $HOME)
done

mkdir $HOME/.vim/
sudo cp -r vim/* $HOME/.vim/

git config --global user.email 'ashley.joshua@gmail.com'
git config --global user.name 'josh'
