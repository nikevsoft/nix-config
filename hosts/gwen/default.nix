# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{ inputs
, outputs
, lib
, config
, pkgs
, ...
}: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-gpu-nvidia # doesn't work
    inputs.hardware.nixosModules.common-pc-ssd

    ../common/optional/gnome.nix
    ../common/optional/pipewire.nix
    ../common/optional/nvidia.nix

    ./hardware-configuration.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: { inherit flake; })) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = [ "/etc/nix/path" ];
  environment.etc =
    lib.mapAttrs'
      (name: value: {
        name = "nix/path/${name}";
        value.source = value.flake;
      })
      config.nix.registry;

  nix.settings = {
    experimental-features = "nix-command flakes";
    # Deduplicate and optimize nix store
    auto-optimise-store = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than +7";
  };

  time.timeZone = "America/Edmonton";

  i18n.defaultLocale = "en_US.UTF-8";

  networking.hostName = "gwen";
  networking.networkmanager.enable = true;

  services.printing.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  users.users = {
    kevin = {
      initialPassword = "changeyourpassword";
      isNormalUser = true;
      description = "Kevin";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };

  system.stateVersion = "23.11";
}
