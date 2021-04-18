#! /bin/bash

# create all config files in home (~/)
touch ~/.bash_profile
touch ~/.bashrc
touch ~/.inputrc
touch ~/.tmux.conf
touch ~/.vimrc

# create all symbolic links to their counterparts in the dotfiles dir (~/dotfiles)
ln -s ~/dotfiles/.bash_profile ~/bash_profile
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.inputrc ~/.inputrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
