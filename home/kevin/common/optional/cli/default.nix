{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ./gh.nix
  ];

  home.packages = with pkgs; [
    lazygit
  ];
}
