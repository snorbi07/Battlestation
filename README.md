# About
This repository contains all the scripts and settings required for setting up my personal Battlestation A.K.A development machine for a clean OS installation.

# Getting started

Most of the scripts are tested with my preferred Linux distribution, OpenSUSE Tumbleweed. Start with a simple XFCE4 desktop install.
With some modifications it could work for other distributions as well, also the given `dotfiles` might be of use.


# Desktop improvements

Install the most the needed utilities by running:

```
sudo zypper in redshift hack-fonts rofi
```

Under _dotfiles_ resides the _Xresources_ config file that _urxvt_ uses to change the look and feel.
This needs to be linked to _`~/.Xresources`.
Note, to reload the _.Xresources file, run `xrdb ~/.Xresources`

Make sure to symlink the given XFCE4 configuration files `dotfiles/xfce4` to `~/.config/xfce4`.


# i3 - desktop environment setup 

The configuration file is located under ~/.config/i3/config. This is what needs to be overriden by the provided one.


## urxvt
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
