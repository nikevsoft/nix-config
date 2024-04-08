{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-gpu-nvidia # doesn't work
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../common/core
    ../common/optional/gnome.nix
    ../common/optional/pipewire.nix
    ../common/optional/nvidia.nix

    ../common/users/kevin
  ];

  networking.hostName = "gwen";
  networking.networkmanager.enable = true;

  system.stateVersion = "23.11";
}
