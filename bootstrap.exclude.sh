#!/bin/bash

# Include utility functions related to bootstrapping script
. "$( pwd )/utils.exclude.sh"

# create symbolic links to each dot file, overriding any existing dotfiles
link () {
	# symlink nvimrc to the nvim config directory
	ln -svf ~/dotfiles/nvimrc ~/.config/nvim/init.vim
	for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|\.gitmodules|.*.md' ) ; do
		# Silently ignore errors here because the files may already exist
		ln -svf "$PWD/$file" "$HOME" || true
	done
}

install_tools () {
	os=$(get_os)
	case $os in
		'Linux')
		  echo "Installing useful stuff using apt. This may take a while..."
			# install tools with apt
			# sh apt.exclude.sh
			;;
		'Mac')
			echo "Installing useful stuff using brew. This may take a while..."
			# install tools with brew
			# sh brew.exclude.sh
			;;
		*)
			echo 'OS not supported'
	esac
}

bootstrap_vim() {
  "$( pwd )/vim.bootstrap.exclude.sh"
}

# # SCRIPT

# # init func (something that describes startup)
# # sync func (here we use symbolic links)
link
# # install tools/dependencies depending on os (macos vs linux)
install_tools
# bootstrap_vim
