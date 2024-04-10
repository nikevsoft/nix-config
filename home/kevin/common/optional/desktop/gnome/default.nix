{ pkgs, ... }:

{
  imports = [ ../common ];

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "Flat-Remix-GTK-Blue-Dark";
      package = pkgs.flat-remix-gtk;
    };

    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };

    gtk3.extraConfig = {
       gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
       gtk-application-prefer-dark-theme = 1;
    };
  };

  home.sessionVariables.GTK_THEME = "Flat-Remix-GTK-Blue-Dark"; # must match the gtk theme name

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/desktop/wm/keybindings" = {
      activate-window-menu = [ "<Super>space" ];
      minimize = [ ];
      unmaximized = [ ];
      maximized = [ ];
      toggle-maximized = [ "<Super>m" ];
      begin-move = [ ];
      begin-resize = [ ];
      close = [ "<Super>q" ];
      cycle-group = [ ];
      cycle-group-backward = [ ];
      cycle-panels = [ ];
      cycle-panels-backward = [ ];
      cycle-windows = [ ];
      cycle-windows-backward = [ ];
      move-to-workspace-1 = [ "<Shift><Super>1" ];
      move-to-workspace-2 = [ "<Shift><Super>2" ];
      move-to-workspace-3 = [ "<Shift><Super>3" ];
      move-to-workspace-4 = [ "<Shift><Super>4" ];
      move-to-workspace-last = [ ];
      switch-applications = [ ];
      switch-applications-backward = [ ];
      switch-group = [ ];
      switch-group-backward = [ ];
      switch-input-source = [ ];
      switch-input-source-backward = [ ];
      switch-panels = [ ];
      switch-panels-backward = [ ];
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      switch-to-workspace-left = [ "<Shift><Super>h" ];
      switch-to-workspace-last = [ "<Shift><Super>l" ];
    };

    "org/gnome/desktop/wm/preferences" = {
      audible-bell = false;
      auto-raise = true;
    };

    "org/gnome/mutter" = {
      edge-tiling = false;
      overlay-key = "Super_R";
      workspaces-only-on-primary = false;
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [ ];
      toggle-tiled-right = [ ];
    };

    "org/gnome/mutter/wayland/keybindings" = {
      restore-shortcuts = [ ];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
      email = [ ];
      home = [ "<Super>f" ];
      www = [ "<Super>b" ];
      help = [ ];
      logout = [ "<Shift><Control><Super>e" ];
      magnifier = [ ];
      magnifier-zoom-in = [ ];
      magnifier-zoom-out = [ ];
      screenreader = [ ];
      screensaver = [ ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Terminal";
      binding = "<Super>t";
      command = "gnome-terminal";
    };

    "org/gnome/shell/keybindings" = {
      focus-active-notification = [ ];
      screenshot = [ ];
      screenshot-window = [ ];
      show-screen-recording-ui = [ "<Shift><Control><Super>r" ];
      show-screenshot-ui = [ "<Shift><Control><Super>p" ];
      toggle-application-view = [ ];
      toggle-quick-settings = [ ];
      toggle-overview = [ "<Super>a" ];
      toggle-message-tray = [ "<Super>v" ];
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;

      enabled-extensions = [
        "pop-shell@system76.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "drive-menu@gnome-shell-extensions.gcampax.github.com"
        "dash-to-dock@micxgx.gmail.com"
        "gsconnect@andyholmes.github.io"
      ];
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Flat-Remix-Blue-Dark";
    };

    "org/gnome/shell/extensions/pop-shell" = {
      activate-launcher = [ "<Super>d" ];
      activate-hint = true;
      activate-hint-border-radius = 2;
      gap-outer = 2;
      gap-inner = 1;
      fullscreen-launcher = true;
      hint-color-rgba = "rgb(181, 203, 255)";
      pop-monitor-down = [ ];
      pop-monitor-up = [ ];
      pop-monitor-left = [ ];
      pop-monitor-right = [ ];
      pop-workspace-down = [ ];
      pop-workspace-up = [ ];
      show-title = false;
      snap-to-grid = false;
      tile-by-default = true;
      tile-enter = [ "<Super>e" ];
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      autohide = true;
      intellihide = false;
      custom-theme-shrink = true;
      apply-custom-theme = true;
      disable-overview-on-startup = true;
      dash-max-icon-size = 40;
      dock-position = "LEFT";
      hot-keys = false;
    };
  };

  home.packages = (with pkgs; [
    pop-launcher
    flat-remix-gnome
  ]) ++ (with pkgs.gnomeExtensions; [
    user-themes
    pop-shell
    dash-to-dock
    gsconnect
  ]);
}
