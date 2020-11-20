# stowise
## _doing Stow wisely_

_stowise_ is an script/application that makes it easy to get started with using Gnu Stow to farm ones dotfiles. 
stowise is entirely written in shell script, you are welcome to examine it, read it, fork it, modify it, commercialise or do whatever you want to do with it.
However, I would rather collaborate with me and make this better and more useful. :)

### How to run the application
1. First install the Gnu Stow for your OS.

```
MacOS: 
brew install stow

Fedora/centos: 
sudo dnf install stow

Debian based (Ubuntu, Pop, Elementary, Mint etc): 
sudo apt install stow

Arch based (Arch, Manjaro etc.): 
sudo pacman -S stow
```

2. clone this repo with 

`git clone https://github.com/daxgoon/stowise.git`

3. cd into the stowise repo

`cd stowise`

4. run stowise

`sh stowise.sh`

### DOCUMENTATION

* What are dotfiles?

   Dotfiles are configuration files which save and determine various settings and configurations of the application we use. 
   In Gnu-like operating systems such as Gnu/Linux, Unix, and the Unix-likes these dot files are located in various places. 
   However, for most applications which honor the POSIX standard, the dotfiles are located under $HOME/.config directory for a given user.
   Its noteworthy to mention that applications may place dotfiles in multiple locations including $HOME and other locations.

* Why do we need a companion application with Gnu Stow?

   Often we already have our config directory packed when we first learn about Gnu Stow. 
   And manually recreating all the directory structure (Remember: Gnu Stow is strict on this.) is a headache.
   Hence we need an application that will recreate the directory structure, copy all the files with preserving their relative paths,
   and make it ready for our Gnu Stow to farm the dots.

   _stowise_ comes in play here.

* What does stowise do?

   It regenerates the complete directory structure of your existing $HOME/.config directory in a directory that it creates (It asks for the desired name first).
   It copies all the config files preserving the relative path and puts them in the new location.
   It backups the existing $HOME/.config to a new location
   It then empties the $HOME/.config
   Finally it goes to the new dotfiles directory and runs stow command one by one so that the Gnu Stow application creates the required symlinks.

* CAVEATS
+ Only directories and dirs+files inside them are copied to the new location leaving out files which are directly under $HOME/.config 
+ Those individual files can be copied back to $HOME/.config from backup location if needed.

* LIMITATIONS
+ Only works for $HOME/.config directory

### Contribuions are welcome.
We would like to expand the functionality of this application making it capable of:
+ Working with multiple directories including $HOME
+ Mimicking POSIX-COMPLIANT behivior for non-compliant applications
+ Improved interactiveness
+ Rollback
+ Others?
### How to contribute?
1. Open a Pull Request with changes
2. Clearly mention the changes


