#!/bin/bash

link () {
	ln -sv ~/dotfiles/nvimrc ~/.config/nvim/init.vim
	for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|\.gitmodules|.*.md' ) ; do
		# Silently ignore errors here because the files may already exist
		ln -sv "$PWD/$file" "$HOME" || true
	done
}

bootstrap_vim() {
  "$( pwd )/vim.bootstrap.exclude.sh"
}

# SCRIPT

# init func (something that describes startup)
# sync func (here we use symbolic links)
link
# install tools/dependencies depending on os (macos vs linux)
bootstrap_vim
