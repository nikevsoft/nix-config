{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    gnome-photos
    gnome-console
    gnome-text-editor
  ]) ++ (with pkgs.gnome; [
    cheese
    epiphany
    gedit
    geary
    gnome-maps
    gnome-music
    gnome-contacts
    gnome-characters
    gnome-initial-setup
    yelp
  ]);

  environment.systemPackages = (with pkgs; [
    colord
  ]) ++ (with pkgs.gnome; [
    totem
    gnome-tweaks
    gnome-session
    gnome-terminal
    gnome-settings-daemon
  ]);

  programs.dconf.enable = true;
}
