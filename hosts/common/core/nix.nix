{ inputs, lib, ... }:

{
  nix = {
    settings = {
      auto-optimise-store = lib.mkDefault true;
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      flake-registry = "";
    };

    # Add each flake input as a registry to make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # Add nixpkgs input to NIX_PATH
    # This lets nix2 commands still use <nixpkgs>
    nixPath = [ "nixpkgs=${inputs.nixpkgs.outPath}" ];

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than +7"; # keep the last 7 generations
    };
  };
}
