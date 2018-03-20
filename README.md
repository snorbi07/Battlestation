# About
This repository contains all the scripts and settings required for setting up my personal Battlestation A.K.A development machine for a clean OS installation.
You'll find scripts that automate the installations and also my personal dot files.

# Getting started

Most of the scripts are tested with my preferred Linux distribution, Debian. Start with a minimalistic install using the net-installer.
With some modifications it could work for other distributions as well.

# i3 - desktop environment setup 

The configuration file is located under ~/.config/i3/config. This is what needs to be overriden by the provided one.
To also install all the used applications, run the following command:

```
apt-get install rxvt-unicode feh fonts-font-awesome rofi redshift fonts-hack-ttf arandr 

```

## urxvt
Under _dotfiles_ resides the _Xresources_ config file that _urxvt_ uses to change the look and feel.
This needs to be linked to _`~/.Xresources`.
Note, to reload the _.Xresources file, run `xrdb ~/.Xresources`

## sudo
By default _sudo_ is not enabled in Debian, so manual addition is requiered.

```
apt-get install sudo
adduser snorbi sudo
```

# zsh
Make sure to install _zsh_ and the dependencies needed by running:
```
zypper in zsh powerline-fonts
```

After follow the install instructions of _ohmyzsh_: https://github.com/robbyrussell/oh-my-zsh

When this is done, remove _~/.zshrc_ and link the provided _dotfiles_ one._

# Emacs setup

Install the latest version of emacs and make sure to remove any existing configuration, since we won't need that!

```
apt-get install emacs
rm -f ~/.emacs
rm -rf ~/.emacs.d
```

To setup the latest version of Emacs with a (my) personal configuration fetch it from [GitHub](https://github.com/snorbi07/emacs.d).
After you cloned the the configuration, make sure to create a symlink to `~/.emacs.d_`.

# Installing node

Just use the [Node Version Manager](https://github.com/creationix/nvm).

