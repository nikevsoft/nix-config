{ config, pkgs, ... }:

{
  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox;

      # Check about:policies#documentation for options.
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
        DisplayMenuBar = "default-off"; # alternatives: "always", "never" or default-on"
        SearchBar = "unified"; # alternative: "separate"

        # Check about:support for extension/add-on ID strings.
        # Valid strings for installation_mode are "allowed", "blocked",
        # "force_installed" and "normal_installed".
        # Basic syntax without listToAttrs is:
        # ExtensionSettings = {
        #   "uuid" = {
        #     install_url = "https://...";
        #     installation_mode = "force_installed";
        #     default_area = "menupanel";
        #   };
        # };
        ExtensionSettings = with builtins;
          let
            extension = shortID: uuid: {
              name = uuid;
              value = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/${shortID}/latest.xpi";
                installation_mode = "force_installed";
                default_area = "menupanel"; # or "navbar"
              };
            };
          in
          listToAttrs [
            { name = "*"; value = { installation_mode = "blocked"; }; }
            (extension "ublock-origin" "uBlock0@raymondhill.net")
            (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
            (extension "vimium-ff" "{d7742d87-e61d-4b78-b8a1-b469842139fa}")
          ];

        # Check about:config for options.
        Preferences =
          let
            newtab = "browser.newtabpage.activity-stream";
            lock-false = {
              Value = false;
              Status = "locked";
            };
            lock-true = {
              Value = true;
              Status = "locked";
            };
          in
          {
            "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
            "browser.migrate.chrome.payment_methods.enabled" = lock-false;
            "browser.topsites.contile.enabled" = lock-false;
            "browser.formfill.enable" = lock-false;
            "browser.search.suggest.enabled" = lock-false;
            "browser.search.suggest.enabled.private" = lock-false;
            "browser.urlbar.suggest.searches" = lock-false;
            "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
            "browser.tabs.crashReporting.sendReport" = lock-false;
            "browser.crashReports.unsubmittedCheck.autoSubmit2" = lock-false;
            "${newtab}.feeds.section.highlights" = lock-false;
            "${newtab}.feeds.section.topstories" = lock-false;
            "${newtab}.feeds.snippets" = lock-false;
            "${newtab}.section.highlights.includePocket" = lock-false;
            "${newtab}.section.highlights.includeBookmarks" = lock-false;
            "${newtab}.section.highlights.includeDownloads" = lock-false;
            "${newtab}.section.highlights.includeVisited" = lock-false;
            "${newtab}.showSponsored" = lock-false;
            "${newtab}.system.showSponsored" = lock-false;
            "${newtab}.showSponsoredTopSites" = lock-false;
            "dom.reporting.crash.enabled" = lock-false;
            "dom.security.https_only_mode" = lock-true;
            "extensions.pocket.enabled" = lock-false;
            "extensions.screenshots.disabled" = lock-true;
            "extensions.formautofill.addresses.enabled" = lock-false;
            "extensions.formautofill.creditCards.enabled" = lock-false;
            "signon.rememberSignons" = lock-false;
            "signon.rememberSignons.visibilityToggle" = lock-false;
          };
      };
    };
  };
}
