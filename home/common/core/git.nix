{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "nikevsoft";
    userEmail = "26445418+nikevsoft@users.noreply.github.com";
    aliases = { };
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
