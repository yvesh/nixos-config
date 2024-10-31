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
     neovim

     # CLI Tools
     zsh
     fish
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
     efitools
     #sbsigntools
     minikube     
     kubectl
     kubernetes-helm
     zed

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
     awscli2
     iftop
     rcm
     libvterm
     libvterm-neovim
     imagemagick
     dnsutils
     sshfs
     xorg.xev
     hwloc
     joplin
     mongoc
     mongodb-tools
     starship
     atuin

     # WM Tools
     rofi
     wofi
     polybar

     # Screenshots
     maim
     grim
     slurp

     # Backgrounds
     feh
     swaybg

     # Locking
     i3lock-fancy-rapid
     xss-lock
     numlockx
     swaylock

     # Clipboard and Notifications
     wl-clipboard
     mako
     copyq
     dunst

     # Misc
     wmname
     xclip
     xmobar
     trayer
     ffcast
     xorg.xwininfo
     xrectsel
     picom
     dbeaver-bin
     
     # Browser
     firefox
     vivaldi
     chromium
     brave

     # Dev (mostly GUI)
     vscode
     jetbrains.pycharm-professional
     #python39Packages.mock
     #jupyter
     #python39Packages.jupyterlab
     #python39Packages.jupyterlab-widgets
     python312
     python312Packages.requests
     python312Packages.netifaces
     python312Packages.pydbus
     python312Packages.psutil
     # python312Packages.contrib
     jetbrains.phpstorm
     mongodb-compass

     # Dev (Languages)
     nodejs
     pnpm
     bun
     yarn
     php83
     php83Packages.composer
     # php74
     # php74Extensions.gd
     # php74Extensions.intl
     # php74Extensions.ldap
     # php74Extensions.zip
     # php74Extensions.xml
     # php74Packages.composer
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
     gnumake
     go
     lua
     docker-compose

     # GUI
     geany
     virt-manager
     scream
     looking-glass-client
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
     networkmanagerapplet
     # shotcut

     # Entertainment
     steam
     lutris
     spotify

     # Terms & Co
     kitty
     alacritty
     zinit

     # Themes
     breeze-gtk
     breeze-icons

     # Fonts
     nerdfonts
     font-awesome
     font-awesome_4
     material-design-icons
     siji

     # Misc
     mesa-demos
     openssl
     libva1
     gst_all_1.gst-vaapi
  ];
}
