# Common network configuration

{ config, pkgs, ... }:

{
  # Dev Hosts on all my machines
  networking.extraHosts =
    ''
      127.0.0.3 j4 j3 j4.local j3.local drupal drupal.local cmt.local
    '';

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.dhcpcd.denyInterfaces = [ "macvtap0@*" ];
  networking.networkmanager.enable = true;

  # Disable ipv6 completly.. Too lazy
  networking.enableIPv6 = false;
  # networking.bridges.br0.interfaces = [ "enp39s0" ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 4011 ];
  # networking.firewall.allowedUDPPorts = [ 4011 ];
  networking.firewall.allowedTCPPorts = [ 9100 ];
  networking.firewall.allowedUDPPorts = [ 9100 ];
  networking.firewall.enable = true;
  networking.firewall.allowPing = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
