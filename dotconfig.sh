#! /bin/bash

# remove all existing config files in home
rm ~/.bash_profile
rm ~/.bashrc
rm ~/.inputrc
rm ~/.tmux.conf
rm ~/.vimrc

# create all symbolic links to their counterparts in the dotfiles dir (~/dotfiles)
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.bashrc ~/.bashrc 
ln -s ~/dotfiles/.inputrc ~/.inputrc 
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf 
ln -s ~/dotfiles/.vimrc ~/.vimrc 

# dependencies
# get nvim configs from vim
# download node
