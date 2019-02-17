# About
This repository contains all the scripts and settings required for setting up my personal Battlestation A.K.A development machine for a clean OS installation.

# Getting started

Most of the scripts are tested with my preferred Linux distribution, openSUSE. Start with a minimalist install (generic desktop or server).

# Zypper
By default openSuse installs recommended packages as well. In order to disable this edit `/etc/zypp/zypp.conf` and set the `solver.onlyRequires = true` value.

## Pacman repositories
https://en.opensuse.org/Additional_package_repositories
To add the Pacman repositories for Tumbleweed, run `zypper ar -cfp 90 http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/ packman`.

# Desktop environment

## Throw out CAPS
To switch caps lock into a ctrl button, run: `setxkbmap -layout us -option ctrl:nocaps`
It is also executed by default in the provided i3 config


## i3 - desktop environment setup 

Install the desktop system and the necessary dependencies of the custom configuration.

```
sudo zypper in i3 rofi arandr feh fontawesome-fonts
```

Remove the default configuration and symlink the provided ones.

```
rm -f ~/.config/i3/config
ln -s ~/Projects/Battlestation/dotfiles/i3/i3config ~/.config/i3/config
ln -s ~/Projects/Battlestation/dotfiles/i3/i3status ~/.config/i3status/config
```

### Installing polybar
Setup the necessary repository from OBS, refresh and install using the following commands:
```
zypper addrepo https://download.opensuse.org/repositories/home:sysek/openSUSE_Tumbleweed/home:sysek.repo
sudo zypper refresh
sudo zypper install polybar pulseaudio-utils
```


Create the necessary config folder for polybar `mkdir -p ~/.config/polybar`. 
Afterwards link the provided config and executable:
```
ln -s ~/Projects/Battlestation/dotfiles/polybar/config ~/.config/polybar/
ln -s ~/Projects/Battlestation/dotfiles/polybar/launch.sh ~/.config/polybar/
```

### Redshift

Redshift is started by i3 with the hardcoded settings and location.

```
sudo zypper in redshift
```

### Fonts and look and feel settings

```
sudo zypper in hack-fonts
```

To make sure that the the X specific global settings are applied, run the following symlink command (where the location of this project is assumed to be `~/Projects/Battlestation`)
This needs to be linked to `~/.Xresources`.
```
cd ~
ln -s Projects/Battlestation/dotfiles/.Xresources
```

### Rofi

```
sudo zypper in rofi
```

To use Rofi for running applications, bind this to your preferred key (for example `super+d`)
```
rofi -show run -lines 20 -theme Monokai -opacity "80" -columns 2 -font "Hack Semibold 14"
```
You can browse the built in themes with `rofi-theme-switcher`.


## urxvt

```
sudo zypper in rxvt-unicode
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

## org-mode files WebDav mount setup
Make sure to install the necessary packages to have a WebDav mount:
```
sudo zypper in davfs2
```

Afterwards add the needed secret entry to `/etc/davfs2/secrets`:
```
https://webdav.fastmail.com <username>@fastmail.com <password>
```

Create a mount point for the WebDav location: `sudo mkdir /mnt/dav`.

Also add the mount entry to `/etc/fstab`:
```
https://webdav.fastmail.com                /mnt/dav                davfs  user,noauto,file_mode=666,dir_mode=777 0 1
```

Afterwards to mount the WebDav folder just run `sudo mount /mnt/dav`.

# NixPkg setup

By default OpenSUSE use btrfs and snapper for the root partition and Nix also puts a `/nix` folder there.
This means that in case of a rollback with snapper data loss would occure for the installed Nix packages.

To avoid this issue a dedicated subvolume should be created for the `/nix` folder.

## Creating a /nix subvolume

The 1st step is to mount the top level subvolume.
```
sudo mount -t btrfs -o subvolid=5 /dev/sda2 /mnt
```
Where `sd2` is the main partition in this case. This will vary from installation to installation.
Afterwards add a new subvolume for Nix, by running:
```
sudo btrfs subvolume create /mnt/@/nix
```

You also need to add a mount point for it, by creating the `/nix` folder on root and changing the owner of it (`chown snorbi:snorbi /nix`)
Afterwards don't forget to add it to `/etc/fstab`.
To verify that it all works, just run `mount -a`

Last step is to follow the NixPkg installation steps outlined on their [site](https://nixos.org/nix/)

### References:
https://btrfs.wiki.kernel.org/index.php/SysadminGuide
https://unix.stackexchange.com/questions/367123/why-is-the-default-top-level-subvolume-id-5-not-shown-in-btrfs-subvolume-list
https://doc.opensuse.org/documentation/leap/reference/html/book.opensuse.reference/cha.snapper.html#sec.snapper.setup.customizing.new_subvolume
https://askubuntu.com/questions/331233/creating-btrfs-subvolume-like-or-home

# Installing node

Use the [Node Version Manager](https://github.com/creationix/nvm).
Make sure to edit `~/.bashrc` and add `--no-use` to the end of the nvm script `nvm.sh --no-use ...` to postpone using loading nvm until it is manually used.

