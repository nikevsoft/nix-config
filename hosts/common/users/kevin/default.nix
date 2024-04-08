{ config, pkgs, ... }:

{
  users.users.kevin = {
    shell = pkgs.zsh;
    isNormalUser = true;
    initialPassword = "changeyourpassword";
    extraGroups = [ "networkmanager" "wheel" ];

    packages = [ pkgs.home-manager ];
  };

  home-manager.users.kevin = import ../../../../home/kevin/${config.networking.hostName}.nix;
}
