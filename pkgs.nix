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

     # nix related
     nix-search
     nix-search-cli

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
     fzf
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
     yazi
     luarocks
     cargo
     ipmitool
     grafana-alloy

     # CLI Hardware
     acpi
     linuxPackages.cpupower
     powertop
     lm_sensors
     smartmontools
     pciutils
     usbutils
     dmidecode
     gptfdisk
     efibootmgr

     # CLI other
     weechat
     xorg.xrandr
     whois
     neofetch
     brightnessctl
     ranger
     # cava  # broken - 2024-11-16
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
     onedrive

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

     # Other Dev (mostly GUI)
     vscode # not really using it anymore, mostly using nvim
     jetbrains.pycharm-professional # For python it's better than vscode
     #python39Packages.mock
     #jupyter
     #python39Packages.jupyterlab
     #python39Packages.jupyterlab-widgets
     #python312
     (python3.withPackages (ps: [ 
      ps.pandas
      ps.requests
      ps.psutil
      ps.requests
      ps.netifaces
      # ps.pydbus
      ps.dbus-python
     ]))
     jetbrains.phpstorm
     mongodb-compass

     # Dev (Languages)
     ## Node
     nodejs
     pnpm
     bun
     yarn
     # pkgs.nodePackages."neovim" # Usually using npm set prefix ~/.npm-global instead

     ## PHP
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
     kdePackages.kdeconnect-kde
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
     # nerdfonts
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
