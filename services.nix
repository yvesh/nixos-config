# Service configuration

{ config, lib, pkgs, ... }:

{
  # ZFS
  # services.zfs.autoScrub.enable = true;
  # services.zfs.autoSnapshot.enable = true;
  # services.zfs.trim.enable = true;

  # Enable flatpak
  services.flatpak.enable = true;

  # Enable ssh (sometimes)
  services.openssh = {
    enable = true;
  };

  # Nginx (PHP disabled)
  services.nginx.enable = true;
  services.nginx.user = "bytee";
  services.nginx.group = "users";
  systemd.services.nginx.serviceConfig.ProtectHome = false;

  services.nginx.virtualHosts = {
    localhost = {
      root = "/home/bytee/srv";
      locations."/" = {
        extraConfig = ''
          index index.htm index.html;
          autoindex on;
        '';
      };
    };
    j4 = {
      serverAliases = [ "j4.local" ];
      root = "/home/bytee/srv/j4";
      locations."/" = {
        extraConfig = ''
          index index.htm index.html;
          autoindex on;
        '';
      };
    };
    j3 = {
      serverAliases = [ "j3.local" ];
      root = "/home/bytee/srv/j3";
      locations."/" = {
        extraConfig = ''
          index index.htm index.html;
          autoindex on;
        '';
      };
    };
    drupal = {
      serverAliases = [ "drupal.local" ];
      root = "/home/bytee/srv/drupal";
      locations."/" = {
        extraConfig = ''
          index index.htm index.html;
          autoindex on;
        '';
      };
    };
    cmt = {
      serverAliases = [ "cmt.local" ];
      root = "/home/bytee/projects/cmt/cmt-webseite-2026/dist/";
      extraConfig = ''
        ssi on;
        ssi_types text/html;
        add_header X-Frame-Options "SAMEORIGIN" always;
        add_header X-Content-Type-Options "nosniff" always;
        add_header X-XSS-Protection "1; mode=block" always;
        add_header Content-Security-Policy "default-src 'self'; script-src 'self' 'unsafe-inline' https://challenges.cloudflare.com https://www.googletagmanager.com; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; img-src 'self' data: https: http://localhost:3000; connect-src 'self' http://localhost:3000 https://www.googletagmanager.com https://www.google-analytics.com https://region1.google-analytics.com https://region2.google-analytics.com https://region3.google-analytics.com https://region4.google-analytics.com https://region5.google-analytics.com https://challenges.cloudflare.com https://api.seminarplan.app; frame-src 'self' https://challenges.cloudflare.com https://www.google.com https://kiberater.cmt.de; font-src 'self' data: https://fonts.gstatic.com; object-src 'none'; media-src 'self'; base-uri 'self'; form-action 'self';" always;
        error_page 404 /404.html;
      '';
      locations."/" = {
        extraConfig = ''
          index index.html index.htm;
          autoindex on;
          try_files $uri $uri/ =404;
        '';
      };
      locations."/fragments/" = {
        extraConfig = ''
          internal;
        '';
      };
      locations."/assets/" = {
        extraConfig = ''
          try_files $uri =404;
        '';
      };
      locations."/api/" = {
        proxyPass = "http://localhost:4000";
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          add_header X-Frame-Options "SAMEORIGIN" always;
          add_header X-Content-Type-Options "nosniff" always;
          add_header X-XSS-Protection "1; mode=block" always;
          add_header Content-Security-Policy "default-src 'self'; script-src 'self' 'unsafe-inline' https://challenges.cloudflare.com https://www.googletagmanager.com; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; img-src 'self' data: https: http://localhost:4000; connect-src 'self' http://localhost:4000 https://www.googletagmanager.com https://www.google-analytics.com https://region1.google-analytics.com https://region2.google-analytics.com https://region3.google-analytics.com https://region4.google-analytics.com https://region5.google-analytics.com https://challenges.cloudflare.com https://api.seminarplan.app; frame-src 'self' https://challenges.cloudflare.com https://www.google.com https://kiberater.cmt.de; font-src 'self' data: https://fonts.gstatic.com; object-src 'none'; media-src 'self'; base-uri 'self'; form-action 'self';" always;
          add_header Cache-Control "no-store";
        '';
      };
      locations."/internal/" = {
        proxyPass = "http://localhost:3000";
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        '';
      };
    };
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # services.displayManager.sddm.enable = true;
  services.displayManager.gdm.enable = true;
  # services.xserver.displayManager.defaultSession = 'none+xmonad';

  # Configure keymap in X11
  services.xserver.xkb.layout = "de";
  # services.xserver.xkbOptions = "eurosign:e";

  # Just for services and some apps..
  services.desktopManager.gnome.enable = true;

  # Most used WMs
  programs.sway = {
	enable = true;
	wrapperFeatures.gtk = true;
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };

  programs.light.enable = true;

  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;

  services.xserver.windowManager.i3.enable = true;

  services.xserver.windowManager.bspwm.enable = true;
  
  # Dank Material Shell
  programs.dms-shell.enable = true;

  # services.xserver.windowManager.qtile.enable = true;
  # services.xserver.windowManager.qtile.extraPackages = p: with p; [ qtile-extras ];

  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };

  services.libinput = {
     enable = true;
     touchpad.disableWhileTyping = true;
  };

  # Compositor
  # services.picom = {
  #   enable = true;
  # };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.epson-escpr2 ];

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Upower
  # services.upower.enable = true;
  # services.thermald.enable = true;
# 3. CPU Governor auf Performance (für den Test am Netzteil)
  powerManagement.cpuFreqGovernor = "performance";

  services.power-profiles-daemon.enable = true;
  services.tlp.enable = false;

  # Firmware Updater
  services.fwupd.enable = true;

  # Gnome Keyring
  services.gnome.gnome-keyring.enable = true;

  # Systemd logind / Sleep
  #services.logind.lidSwitchExternalPower = "ignore";
  services.logind.settings.Login.HandleLidSwitchExternalPower = "ignore";
  systemd.targets.hibernate.enable = false;

  # Emacs
  # services.emacs.enable = true;
  # services.emacs.package import /home/bytee/.emacs.d { pkgs = pkgs };
  services.emacs.install = true;

  # Node Exporter
  # services.prometheus.exporters.node = {
  #   enable = true;
  #   port = 9100;
  #   enabledCollectors = [ "systemd" "zfs" ];
  #   # /nix/store/zgsw0yx18v10xa58psanfabmg95nl2bb-node_exporter-1.8.1/bin/node_exporter  --help
  #   extraFlags = [ "--collector.ethtool" "--collector.softirqs" "--collector.tcpstat" ];
  # };

  # Dynamic libraries for unpackaged programs
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    glibc
    libcxx
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
  };

  programs.fish.enable = true;
  programs.zsh.enable = true;

  # Virtualisation
  virtualisation.libvirtd = {
	enable = true;
	onBoot = "ignore";
	onShutdown = "shutdown";
#	qemuRunAsRoot = false;
	qemu = {
         package = pkgs.qemu_kvm;
         #ovmf.enable = true;
	};
  };

  systemd.tmpfiles.rules = [
    "f /dev/shm/looking-glass 0660 bytee qemu-libvirtd -"
  ];

  virtualisation.docker.enable = true;

  # services.ollama = {
  #   enable = true;
  #   acceleration = "cuda";
  # };

  # services.open-webui.enable = true;
}
