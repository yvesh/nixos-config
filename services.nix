# Service configuration

{ config, lib, pkgs, ... }:

{
   # ZFS
  services.zfs.autoScrub.enable = true;
  services.zfs.autoSnapshot.enable = true;
  services.zfs.trim.enable = true;

  # Enable flatpak
  services.flatpak.enable = true;

  # Simple Apache + PHP Stack
  services.httpd.enable = true;
  services.httpd.adminAddr = "root@localhost";
  services.httpd.user = "bytee";
  services.httpd.enablePHP = true;

  # Some local vhosts
  services.httpd.virtualHosts = {
    localhost = {
      documentRoot = "/home/bytee/srv";
      extraConfig =
 ''
        <Directory "/home/bytee/srv">
              DirectoryIndex index.php index.htm index.html
              Options FollowSymLinks
              AllowOverride All
       </Directory>
        '';
    };
    j4 = {
      serverAliases = [ "j4.local" ];
      documentRoot = "/home/bytee/srv/j4";
      extraConfig =
 ''
        <Directory "/home/bytee/srv/j4">
              DirectoryIndex index.php index.htm index.html
              Options FollowSymLinks
              AllowOverride All
       </Directory>
        '';    };
    j3 = {
      documentRoot = "/home/bytee/srv/j3";
      serverAliases = [ "j3.local" ];
      extraConfig =
 ''
        <Directory "/home/bytee/srv/j3">
              DirectoryIndex index.php index.htm index.html
              Options FollowSymLinks
              AllowOverride All
       </Directory>
        '';
    };
};

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  # services.xserver.displayManager.defaultSession = 'none+xmonad';

  # Configure keymap in X11
  services.xserver.layout = "de";
  # services.xserver.xkbOptions = "eurosign:e";

  # Just for services and some apps..
  services.xserver.desktopManager.gnome.enable = true;

  # Most used WMs
  services.xserver.windowManager.i3.enable = true;
  services.xserver.windowManager.bspwm.enable = true;
  services.xserver.windowManager.qtile.enable = true;
  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };

  services.xserver.libinput = {
     enable = true;
     touchpad.disableWhileTyping = true;
  };

  # Compositor
  services.picom = {
    enable = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.epson-escpr2 ];

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Upower
  services.upower.enable = true;
  services.thermald.enable = true;

  # Gnome Keyring
  services.gnome.gnome-keyring.enable = true;

  # Systemd logind
  services.logind.lidSwitchExternalPower = "ignore";

  # Emacs
  # services.emacs.enable = true;
  # services.emacs.package import /home/bytee/.emacs.d { pkgs = pkgs };
  services.emacs.install = true;

  # User Services

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
  };

  # Virtualisation
  virtualisation.libvirtd.enable = true;
  virtualisation.docker.enable = true;
}
