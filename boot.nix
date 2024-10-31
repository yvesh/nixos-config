# Boot, Filesystem and Hardware config
{ config, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # boot.initrd.supportedFilesystems = ["zfs"];
  # boot.supportedFilesystems = ["zfs"];
  # boot.zfs.requestEncryptionCredentials = true;

  # boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;

  # boot.zfs.enableUnstable = true;

  # Not needed for desktop
  boot.kernelParams = [ "mitigations=off" "intel_iommu=on" ];
  # hardware.cpu.amd.updateMicrocode = true;
  
  # TODO move to machine
  hardware.cpu.intel.updateMicrocode = true;

  # 3D Accel
  hardware.graphics.enable = true;

  # TODO move to machine
  hardware.graphics.extraPackages = with pkgs; [
      intel-ocl
      vpl-gpu-rt
      intel-vaapi-driver
      intel-media-driver
      intel-compute-runtime
  ];
  hardware.graphics.enable32Bit = true;

  # Samba Shares
  # fileSystems."/mnt/fast" = {
  # device = "//10.0.1.20/fast";
  #       fsType = "cifs";
  #       options = let
  #         automount_opts = "x-systemd.automount,uid=1000,gid=100,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

  #       in ["${automount_opts},credentials=/etc/nixos/smb-secrets"];
  # };

  # fileSystems."/mnt/slowbackup" = {
  # device = "//10.0.1.20/slowbackup";
  #       fsType = "cifs";
  #       options = let
  #           automount_opts = "x-systemd.automount,uid=1000,gid=100,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

  #       in ["${automount_opts},credentials=/etc/nixos/smb-secrets"];
  # };
}
