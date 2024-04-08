{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [
    ./common/core
    ./common/optional/cli
    ./common/optional/desktop/gnome
  ];
}
