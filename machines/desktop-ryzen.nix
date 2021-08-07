# This contains setting which are different per machine
# Desktop PC (Ryzen 3950X, 64 GB Memory, 2 TB NVME, Radeon 5700 XT)

{ config, pkgs, ... }:

{
  # Video Driver
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Networking
  networking.hostId = "42424244";
  networking.hostName = "y39";

  networking.interfaces.enp36s0f0.useDHCP = true;
  # networking.interfaces.wlp2s0.useDHCP = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
}
