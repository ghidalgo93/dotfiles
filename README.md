dotfiles

All dotfiles stored in the main directory of this repo. Current list includes:
-bashrc
-vimrc
-tmuc.conf

Setup:

-add dotfiles directory to home directory
-create a symbolic link to each of the dot files wanted
example: ~/.vimrc ---> ~/dotfiles/.vimrc (or bashrc)

    # ln establishes a link; -s flag creates a 'soft' or symbolic link
    # ~ is shorthand for your home directory
    
    ln -s ~/dotfiles/.vimrc ~/.vimrc
    
Install: 

Vim-plug for Unix   
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


