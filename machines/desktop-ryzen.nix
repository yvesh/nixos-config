# This contains setting which are different per machine
# Desktop PC (Ryzen 5950X, 128 GB Memory, 2 TB NVME, Radeon 5700 XT, Radeon 6600 XT)

{ config, pkgs, ... }:

{
  # Video Driver
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Networking
  networking.hostId = "42424244";
  networking.hostName = "y39";

  boot.initrd.availableKernelModules = [ "amdgpu" "vfio-pci" ];
  
  # Vfio for 6600XT
  boot.initrd.preDeviceCommands = ''
  DEVS="0000:32:00.0 0000:32:00.1"
  for DEV in $DEVS; do
    echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
  done
  modprobe -i vfio-pci
'';

  boot.kernelParams = [ "mitigations=off" "amd_iommu=on" ];
  boot.kernelModules = [ "kvm-amd" ];

  # networking.interfaces.enp45s0f0.useDHCP = true;
  # networking.interfaces.wlp2s0.useDHCP = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
}
