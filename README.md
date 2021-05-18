# ghidalgo's dotfiles

The place for all of my personal dotfiles - where I develop, test, and keep all of my configs to quickly and easily get my environment up and running!

## Syncing: 

Symbolic links are the current method for syncing dotfiles. All syncing is done in the bootstrap.exclude.sh script, where all files (excluding things like .gitignore and setup scripts that include the .exclude. expressions) are symbolically linked to their respective location - usually the home directory.

## Bootstrapping:

The main script I am using to bootstrap all my configs is (unsurprisingly) bootstrap.exclude.sh. This is the script which links dotfiles, installs tools based on OS, and installs vim specific tools.   

## Operating System:

I development almost exclusively on linux systems, though I am working on this project during a trip on my mac. This means that I am trying to have some sort of OS detection that enables me to bootstrap for any OS I am working on. Stay tuned...

## Setup:

### First, all shell scripts must be made executable

These include the bootstrap, utils, brew, apt, and vim files - and can be made executable with:
```
chmod +x <filename>
```
in the command prompt within the project directory (soon there will be a script to do this).

### Second, the bootstrap.exclude.sh file must be run

Once all shell scripts are made executable, this can be run with: 
```
./bootstrap.exclude.sh
```
There is currently no way monitor progress once it starts running. As soon as I learn how to do this I will implement it.

## Notes:

I've started to do some more development on my own, at work, and in class and have needed a way to be able to port my environment to whatever local system I am working on. After a series of OS reinstallations, trips where I couldn't use my desktop, and other mechanical failures I decided to learn a bit about dotfiles and how to create my own personalized repo. I have been learning an incredible amount of bash scripting, system variables, configuration files, and probably a ton of other things I am missing or just not smart enough to currently understand. 


An incredible shout out to [Mohammed Ajmal Siddiqui](https://github.com/ajmalsiddiqui) who kindly put his own dotfile repo and learning process online for people like me to find and learn! Almost everything I did here was based in some way off Mohammed's system. If you're interested in learning more, I'd reccomend checking out Mohammed's repo, or check this one out as it evolves. I am hoping to document this process and everything I learn.

### Things I plan to do:
- [ ] Get script for linux tools up and running (apt.exclude.sh)
- [ ] Better OS detection
- [ ] Write script to make shell scripts executable
- [ ] Find a good way to remove links (to truly sync and not just link first time)
- [ ] Implement prompts during the bootstrap script
