# This contains setting which are different per machine
# ThreadRipper TR7980X, 384 GB Memory, 7900 XTX

{ config, pkgs, ... }:

{
  # Video Driver
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Networking
  networking.hostId = "42424246";
  networking.hostName = "yTR7980";

  # hardware.nvidia = {
  #   modesetting.enable = true;
  #   open = true;
  #   nvidiaSettings = true;
  #   package = config.boot.kernelPackages.nvidiaPackages.beta;
  #   forceFullCompositionPipeline = true;
  # };

  # hardware.nvidia-container-toolkit.enable = true;

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
