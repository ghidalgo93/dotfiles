#!/bin/bash

link () {
	for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|\.gitmodules|.*.md' ) ; do
		# Silently ignore errors here because the files may already exist
		ln -sv "$PWD/$file" "$HOME" || true
	done
}

# SCRIPT

# init func (something that describes startup)
# sync func (here we use symbolic links)
link
# install tools depending on os (macos vs linux)

