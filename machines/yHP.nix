# This contains setting which are different per machine
# HP EliteBook 845 G7 (Ryzen 4750U, 64 GB Memory, 2 TB NVME, AMDGPU)

{ config, pkgs, ... }:

{
  # Video Driver
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Networking
  networking.hostId = "42424243";
  networking.hostName = "yAWnix";

  # networking.interfaces.enp5s0.useDHCP = true;
#  networking.interfaces.wlp2s0.useDHCP = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
}
