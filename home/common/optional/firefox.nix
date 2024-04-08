{ inputs, pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles = {
      kevin = {
        id = 0;
        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          bitwarden
          darkreader
          ublock-origin
          vimium
        ];
      };

      guest = {
        id = 1;
        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          foxyproxy-standard
          darkreader
          ublock-origin
          vimium
        ];
      };
    };

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
      DisableFirefoxAccounts = false;
      DisableAccounts = false;
      DisableFirefoxScreenshots = false;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "newtab"; # alternatives: "always" or "newtab"
      DisplayMenuBar = "default-off"; # alternatives: "always", "never" or default-on"
      SearchBar = "unified"; # alternative: "separate"

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
}
