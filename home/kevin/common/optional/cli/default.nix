{ pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./bash.nix
    ./git.nix
    ./gh.nix
    ./helix.nix
  ];

  home.packages = with pkgs; [
    lazygit
  ];
}
