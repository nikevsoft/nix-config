{ pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./bash.nix
    ./git.nix
    ./gh.nix
  ];

  home.packages = with pkgs; [
    lazygit
  ];
}
