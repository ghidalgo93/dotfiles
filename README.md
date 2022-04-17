# ghidalgo's dotfiles

The place for all of my personal dotfiles - where I develop, test, and keep all of my configs to quickly and easily get my environment up and running!

I use `stow` to manage my dotfiles as I find it's much easier for me to understand what I'm actually doing and vizualize the process, pick and choose what I want (ex. vim vs. nvim) for certain situaltions, and manage my configs for different OSs in my own way without dealing with a script. It may more work than just relying on a script... but I really like to understand what's going on and not obscure it away. There are definitely ways to get all of this into a script - and I will probably do that someday - but for now, manually stowing things is just fine.

### Installation

First step is to clone this repo to your system's home directory. This is super important because by default `stow` will put symlinks one directory above where it is run (i.e. its parent directory). I am going to document the full stow command to make sure things are unambiguous but if you run the default commands we want to make sure this still runs.

1) `git clone <this repo> ~`


and you're done! The next step is to stow whatever is needed.

### Stowing

Navigate into the dotfiles directory with `cd ~/dotfiles`

#### Testing

It's a good idea to test the stow first to make sure we've set everything up correctly. To do that we can use the `-n` flag to designate "no" and the `-v` flag to set "verbose." This will tell us what we're about to do. We will also explicity tell stow where to stow the symlinks using the `-t` flag. The one "non-explicit" flag I'm going to use is the `-S` flag which is the default "stow" action, to unstow you can use the `-D` flag which I will use later. 

`stow -nvt ~ <directory with contents you want to stow>`

I reccomend doing this testing before every stow, it will tell you exactly what it's diong and let you know if there are any issues.

#### Stow

I reccomend making backups of any files it would overwrite/adopt, for example:

`mv ~/.bashrc ~/.bashrc.bak`

Just in case things go wrong.

Once your tests give you the results you're looking for, you can go ahead and stow your desired configs using:

`stow -vt ~ <directory with contents you want to stow>`

Just take out the `-n` flag to actually do it.

#### Unstow

To unlink/unstow your files you can use the `-D` flag

`stow -vDt ~ <directory with contents you want to stow>`

