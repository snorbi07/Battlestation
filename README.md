# About
This repository contains all the scripts and settings required for setting up my personal Battlestation A.K.A development machine for a clean OS installation.
You'll find scripts that automate the installations and also my personal dot files.

# Getting started

Most of the scripts are tested with my preferred Linux distribution, [openSUSE Tumbleweed](https://en.opensuse.org/Portal:Tumbleweed). 
With some modifications it could work for other distributions as well. 

For automating various tasks [Ansible](https://www.ansible.com/) is used, so you'll need to install that manually. Just follow the installation instructions provided on their site.
To save you a round-trip, under openSUSE just run:

```
sudo zypper in --no-recommends ansible
```

## Ansible configuration

After the installation we need to add extend the default inventory with an entry for managing _localhost_ seamlessly.
To do that just run:
```
sudo sh -c 'echo "localhost ansible_connect=local" >> /etc/ansible/hosts' 
```

To verify that everything works, run:

```
ansible all -m shell -a 'echo Battlestation preparation complete!'
```

You should see something like this:
```
localhost | SUCCESS | rc=0 >>
Battlestation preparation complete!
```

# Roles

Roles provide installation scripts for ensuring the availability of various prerequisites for getting things done.
Also, the provided script files can be seen as a form of documentation for the tools used.

To prepare our Battlestation for working with a specific role, just run _ansible-playbook_ with a specific role.

```
ansible-playbook roles/path/to/feature.yaml -kK
```

This should work for all roles. You should get a popup asking for your password and sudo password as well when necessary.

## Emacs setup
To setup the latest version of Emacs with a (my) personal configuration run the provided playbook.
After ensuring that Emacs is installed it removes any existing configuration - usually distro defaults - and links to the one checked out from GitHub.

ansible-playbook roles/workstation/emacs.yaml -kK

## Python support
The necessary packages (OS, PiP) are installed by the Ansible playbook found under _roles/devtools/python.yaml_.

```
ansible-playbook roles/devtools/python.yaml -kK
```
