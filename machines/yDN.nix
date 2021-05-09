# This contains setting which are different per machine
# Asus DUO 15 (Ryzen 5900HX, 48 GB Memory, 2 TB SSD, Nvidia RTX 3070)
# Nvidia graphics only (i switch to modesetting, when i ever need it manually)

{ config, pkgs, ... }:

{
  # Video Driver
  services.xserver.videoDrivers = [ "nvidia" ];

  # Networking
  networking.hostId = "42424242";
  networking.hostName = "yDN";

  networking.interfaces.enp3s0.useDHCP = true;
  networking.interfaces.wlp4s0.useDHCP = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
}
