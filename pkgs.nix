# List of system packages
# I am too lazy to install them per user / with home-manager
{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     # Editor & Deps
     emacs
     vim

     # CLI Tools
     zsh
     wget
     nmap
     unzip
     git
     curl
     procps
     gnupg
     smbclient
     mariadb-client
     htop
     jq
     fd
     bc
     bison
     flex
     ripgrep
     ansible

     # CLI Hardware
     acpi
     linuxPackages.cpupower
     powertop
     lm_sensors
     smartmontools

     # CLI other
     weechat
     xorg.xrandr
     whois
     neofetch
     brightnessctl
     ranger
     cava
     aws
     iftop
     rcm

     # WM Tools
     rofi
     polybar
     maim
     feh
     i3lock-fancy-rapid
     xss-lock
     numlockx
     copyq
     dunst
     wmname
     xclip
     xmobar
     trayer

     # Browser
     firefox
     vivaldi

     # Dev (mostly GUI)
     jetbrains.phpstorm
     jetbrains.pycharm-professional
     mongodb-compass
     vscode

     # Dev (Languages)
     nodejs-14_x
     yarn
     php80
     php80Extensions.gd
     php80Packages.phpcs
     php80Extensions.zip
     php80Extensions.xml
     php80Extensions.bz2
     php80Extensions.yaml
     php80Extensions.ldap
     php80Extensions.intl
     php80Packages.composer
     gcc
     docker-compose

     # GUI
     geany
     virt-manager
     gnome3.gnome-tweak-tool
     arandr
     obs-studio
     darktable
     xfce.thunar
     xfce.tumbler
     xfce.exo
     xfce.xfconf
     lxappearance
     pavucontrol
     ffmpeg

     # Entertainment
     steam
     lutris
     spotify

     # Terms & Co
     alacritty
     rxvt_unicode
     zinit

     # Themes
     breeze-gtk
     breeze-icons

     # Fonts
     nerdfonts
     font-awesome-ttf
     material-design-icons
     siji

     # Misc
     mesa-demos
     openssl
     pinentry_gnome
  ];
}
