[![NixOS 21.05](https://img.shields.io/badge/NixOS-v21.05-blue.svg?style=flat-square&logo=NixOS&logoColor=white)](https://nixos.org)

## Simple multi-machine NixOS Configuration

> This is just the base NixOS system configuration. My dotfiles can be found in yvesh/dotfiles (too lazy for homemanager (yet)). Mostly targeted at desktops / notebooks.

### Overview

**OS**: NixOS
**Bar**: Xmobar / Polybar / Bumblebee-Status (Depending on WM)
**WM**: Xmonad / BSPWM / Sway (Mostly Xmonad)
**DM**: SDDM
**TERM**: Alacritty / rxvt-unicode / st
**FS**: Enc. ZFS
**Services**: docker, libvirtd (Kvm), Apache httpd, flatpak, zfs, xserver, picom, cups, upower, thermald, emacs..

### Installation

* Download the latest NixOS build from [nixos.org](https://nixos.org/download.html)
* Boot from it
* Follow the installation instructions for partitioning, base system installation (Personally I am using encrypted ZFS with multiple subvols)
* Copy this repo to `/etc/nixos`
* Create a profile for your machine(s) in the `./machines` directory
* Link it to `/etc/nixos/machine.nix`
* Do a `nixos-rebuild switch` (depending on your GPU you may need a reboot)
* Continue setting up your system, dotfiles..
* Don't forget to set a root and user password

### Current machine profiles

* Asus ROG 15 DUO (Ryzen 5900HX, 48 GB RAM, Geforce RTX 3070)
* HP Gen 845 (Ryzen 4750U, 64 GB Ram, AMDGPU)

### Overview

##### boot.nix
Common settings related to the Bootloader, Kernel, Hardware and Mounts.

##### configuration.nix
Main entry file, includes some basic settings, like users or timezone.

##### networking.nix
Common network configuration for all my machines.

##### pkgs.nix
Packages to install (which are not selected through a service, program.. directive)

##### services.nix
Service (System + User) configuration, Virtualisation..

##### machines/
Profiles for my different machines. One links to `machine.nix`

