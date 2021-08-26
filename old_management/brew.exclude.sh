#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Install homebrew if it is not installed
which brew 1>&/dev/null
if [ ! "$?" -eq 0 ] ; then
	echo "Homebrew not installed. Attempting to install Homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	if [ ! "$?" -eq 0 ] ; then
		echo "Something went wrong. Exiting..." && exit 1
	fi
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade


# ---------------------------------------------
# Basic Utilities
# ---------------------------------------------

# Core Utils
brew install coreutils


# --------------------------------------------
# Programming Languages and Frameworks
# ---------------------------------------------

# NodeJS 
brew install node

# Python 3
brew install python


# ---------------------------------------------
# Tools I use often
# ---------------------------------------------

# Docker for containerization
brew install docker

# tmux :'D 
brew install tmux

# ripgrep
brew install ripgrep

# ---------------------------------------------
# Misc
# ---------------------------------------------

# Remove outdated versions from the cellar
brew cleanup
