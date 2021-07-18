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
     tcpdump
     unzip
     git
     curl
     procps
     gnupg
     htop
     jq
     fd
     bc
     bison
     flex
     ripgrep
     ansible
     mariadb-client
     mongoc
     smbclient

     # CLI Hardware
     acpi
     linuxPackages.cpupower
     powertop
     lm_sensors
     smartmontools
     pciutils
     usbutils
     dmidecode

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
     libvterm
     libvterm-neovim
     imagemagick
     dnsutils

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
     chromium
     brave

     # Dev (mostly GUI)
     vscode
     jetbrains.pycharm-professional
     jupyter
     python39Packages.jupyterlab
     python39Packages.jupyterlab-widgets
     jetbrains.phpstorm
     mongodb-compass

     # Dev (Languages)
     nodejs-14_x
     yarn
     php74
     php74Extensions.gd
     php74Extensions.intl
     php74Extensions.ldap
     php74Extensions.zip
     php74Extensions.xml
     php74Packages.composer
     # php80
     # php80Extensions.gd
     # php80Packages.phpcs
     # php80Extensions.zip
     # php80Extensions.xml
     # php80Extensions.bz2
     # php80Extensions.yaml
     # php80Extensions.ldap
     # php80Extensions.intl
     # php80Packages.composer
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
     remmina

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
     libva1
     gst_all_1.gst-vaapi
  ];
}
