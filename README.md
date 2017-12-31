# About
This repository contains all the scripts and settings required for setting up my personal Battlestation A.K.A development machine for a clean OS installation.
You'll find scripts that automate the installations and also my personal dot files.

# Getting started

Most of the scripts are tested with my preferred Linux distribution, [openSUSE Tumbleweed](https://en.opensuse.org/Portal:Tumbleweed). 
With some modifications it could work for other distributions as well.

# i3 - desktop environment setup 

The configuration file is located under ~/.config/i3/config. This is what needs to be overriden by the provided one.
To also install all the used applications, run the following command:

```
zypper in rxvt-unicode feh fontawesome-fonts

```

# Installing node

Just use the [Node Version Manager](https://github.com/creationix/nvm).


## Emacs setup

Install the latest version of emacs and make sure to remove any existing configuration, since we won't need that!

```
zypper in emacs
rm -f ~/.emacs
rm -rf ~/.emacs.d
```

To setup the latest version of Emacs with a (my) personal configuration fetch it from [GitHub](https://github.com/snorbi07/emacs.d).
After you cloned the the configuration, make sure to create a symlink to `~/.emacs.d_`.




