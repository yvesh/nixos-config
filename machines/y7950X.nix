# This contains setting which are different per machine
# Ryzen 7950X, 64 GB Memory, Raden 7700 XT

{ config, pkgs, ... }:

{
  # Video Driver
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Networking
  networking.hostId = "42424245";
  networking.hostName = "y7950NIX";

  # hardware.graphics = {
  #   enable = true;
  #   extraPackages = with pkgs; [
  #     vpl-gpu-rt          # for newer GPUs on NixOS >24.05 or unstable
  #     # onevpl-intel-gpu  # for newer GPUs on NixOS <= 24.05
  #     # intel-media-sdk   # for older GPUs
  #   ];
  # };

  # networking.interfaces.enp5s0.useDHCP = true;
#  networking.interfaces.wlp2s0.useDHCP = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
}
