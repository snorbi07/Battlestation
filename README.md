# About
This repository contains all the scripts and settings required for setting up my personal Battlestation A.K.A development machine for a clean OS installation.

# Getting started

Most of the scripts are tested with my preferred Linux distribution, Debian (sid). Start with a minimalist net-install. 


# APT

## Tracking changes of packages

In order to keep track of what changed in the upgraded packages, install the following `apt` hook and configure it
```
apt install apt-listchanges; dpkg-reconfigure apt-listchanges
```

## Tracking bugs in updated and installed packages

Since this guide assumes that the unstable branch of Debian is used, it is recommended to check for critical issues in the installed packages, so we can skip extremly buggy updates.
```
apt install apt-listbugs
```

# Desktop environment

## XFCE4 
Install XFCE by running the following command. The default systemd target is the graphical one, so after a restart the system should boot into XFCE4.
```
apt install xfce4 xfce4-goodies
```

## i3 - desktop environment setup 

Install the desktop system and the necessary dependencies of the custom configuration.

```
apt install i3 fonts-font-awesome rofi arandr feh
```

Remove the default configuration and symlink the provided ones.

```
rm -f ~/.config/i3/config
ln -s ~/Projects/Battlestation/dotfiles/i3/i3config ~/.config/i3/config
ln -s ~/Projects/Battlestation/dotfiles/i3/i3status ~/.config/i3status/config
```

### Redshift

```
apt install redshift-gtk
```

### Fonts and look and feel settings

```
apt install fonts-hack
```

To make sure that the the X specific global settings are applied, run the following symlink command (where the location of this project is assumed to be `~/Projects/Battlestation`)
This needs to be linked to `~/.Xresources`.
```
cd ~
ln -s Projects/Battlestation/dotfiles/.Xresources
```

### Rofi

```
apt install rofi
```

To use Rofi for running applications, bind this to your preferred key (for example `super+d`)
```
rofi -show run -lines 20 -theme Monokai -opacity "80" -columns 2 -font "Hack Semibold 14"
```
You can browse the built in themes with `rofi-theme-switcher`.


## urxvt

```
apt install rxvt-unicode
```

Under _dotfiles_ resides the _Xresources_ config file that _urxvt_ uses to change the look and feel.
This needs to be linked to _`~/.Xresources`.
Note, to reload the _.Xresources file, run `xrdb ~/.Xresources`

# zsh
Make sure to install _zsh_ and the dependencies needed by running:
```
sudo zypper in zsh powerline-fonts
```

After follow the install instructions of _ohmyzsh_: https://github.com/robbyrussell/oh-my-zsh

When this is done, remove _~/.zshrc_ and link the provided _dotfiles_ one._

# Emacs setup

Install the latest version of emacs and make sure to remove any existing configuration, since we won't need that!

```
sudo zypper in install emacs
rm -f ~/.emacs
rm -rf ~/.emacs.d
```

To setup the latest version of Emacs with a (my) personal configuration fetch it from [GitHub](https://github.com/snorbi07/emacs.d).
After you cloned the the configuration, make sure to create a symlink to `~/.emacs.d_`.

# Installing node

Just use the [Node Version Manager](https://github.com/creationix/nvm).
The ZSH configuration disables this as it slows down the application startup. In order to use it in a shell, run the given `loadnvm` alias.
