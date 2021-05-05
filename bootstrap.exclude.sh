#!/bin/bash

. "$( pwd )/utils.exclude.sh"

link () {
	# symlink nvimrc to the nvim config directory
	ln -sv ~/dotfiles/nvimrc ~/.config/nvim/init.vim
	for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|\.gitmodules|.*.md' ) ; do
		# Silently ignore errors here because the files may already exist
		ln -sv "$PWD/$file" "$HOME" || true
	done
}

# TODO rewrite this to check for os=unknown, use the execute_func_with_prompt wrapper, etc
install_tools () {
  local os=$(get_os)
	if [ "$os" = 'darwin' ] ; then
		echo "Installing useful stuff using brew. This may take a while..."
		sh brew.exclude.sh
	else
		echo "Skipping installations using Homebrew because MacOS was not detected..."
	fi

	if [ "$os" = 'debian' ] ; then
		echo echo_with_prompt "Installing useful stuff using apt. This may take a while..."
		sh apt.exclude.sh
	else
		echo "Skipping installations using apt because Debian/Linux was not detected..."
	fi
}

bootstrap_vim() {
  "$( pwd )/vim.bootstrap.exclude.sh"
}

# SCRIPT

# init func (something that describes startup)
# sync func (here we use symbolic links)
link
# install tools/dependencies depending on os (macos vs linux)
install_tools
bootstrap_vim
