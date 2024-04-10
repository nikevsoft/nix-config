{ ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    autocd = true;

    dotDir = ".config/zsh";

    history = {
      ignoreDups = true;
      save = 50000;
      share = true;
      size = 50000;
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "sudo" ];
    };
  };
}
