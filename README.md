dotfiles

All dotfiles stored in the main directory of this repo. Current list includes:
-bashrc
-vimrc

To install:

-add dotfiles directory to home directory
-create a symbolic link, example: ~/.vimrc ---> ~/dotfiles/.vimrc (or bashrc)

    ln -s ~/dotfiles/.vimrc ~/.vimrc
    
    # ln establishes a link; -s flag creates a 'soft' or symbolic link
    # ~ is shorthand for your home directory
