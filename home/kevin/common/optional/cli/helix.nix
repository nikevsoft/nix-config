{ ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "base16_transparent";
      editor = {
        color-modes = true;
        line-number = "relative";
        indent-guides = {
          render = true;
        };
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };
  };

  home.sessionVariables.COLORTERM = "truecolor";
}
