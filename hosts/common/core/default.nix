{ inputs, outputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./nix.nix
    ./bootloader.nix
    ./locale.nix
    ./keyboard.nix
    ./printing.nix
    ./zsh.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  home-manager.extraSpecialArgs = {
    inherit inputs outputs;
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  hardware.enableRedistributableFirmware = true;
}

