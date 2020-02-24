{ buildFirefoxXpiAddon, fetchurl, stdenv }:
  {
    "https-everywhere" = buildFirefoxXpiAddon {
      pname = "https-everywhere";
      version = "2019.11.7";
      addonId = "https-everywhere@eff.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/3442258/https_everywhere-2019.11.7-an+fx.xpi?src=";
      sha256 = "b4c33fcc43f9da395ff0b139cec005afa43f007c45a991d6089402c0b78288e6";
      meta = with stdenv.lib;
      {
        homepage = "https://www.eff.org/https-everywhere";
        description = "Encrypt the web! HTTPS Everywhere is a Firefox extension to protect your communications by enabling HTTPS encryption automatically on sites that are known to support it, even when you type URLs or follow links that omit the https: prefix.";
        platforms = platforms.all;
        };
      };
    "i-hate-tabs-sdi-for-firefox" = buildFirefoxXpiAddon {
      pname = "i-hate-tabs-sdi-for-firefox";
      version = "0.1";
      addonId = "{1b7bafcd-5f58-4274-aedf-d77a26196bb9}";
      url = "https://addons.mozilla.org/firefox/downloads/file/894461/i_hate_tabs_sdi_for_firefox-0.1-an+fx-linux.xpi?src=";
      sha256 = "fb620ef9490047fbfdd172d205e59c140aa21c67a027723cf37800b1bb076a6f";
      meta = with stdenv.lib;
      {
        description = "Automatically converts new tabs to new windows instead.";
        license = licenses.mpl20;
        platforms = platforms.all;
        };
      };
    "ipfs-companion" = buildFirefoxXpiAddon {
      pname = "ipfs-companion";
      version = "2.10.0";
      addonId = "ipfs-firefox-addon@lidel.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/3469552/ipfs_companion-2.10.0-an+fx.xpi?src=";
      sha256 = "b99b250c4b6bc5ec2e3e83f619b9e9d6ffb0a913cb1415a52beb4a494ef33772";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/ipfs-shipyard/ipfs-companion";
        description = "Official browser extension that simplifies access to IPFS resources";
        platforms = platforms.all;
        };
      };
    "matte-black-red" = buildFirefoxXpiAddon {
      pname = "matte-black-red";
      version = "2019.12.27";
      addonId = "{a7589411-c5f6-41cf-8bdc-f66527d9d930}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3475706/matte_black_red-2019.12.27-an+fx.xpi?src=";
      sha256 = "e125a666a909baf8be2b21bae976b4d5233198ba4c0d61bc2f80dff8b946a71d";
      meta = with stdenv.lib;
      {
        homepage = "https://elijahlopez.herokuapp.com/";
        description = "A modern dark / Matte Black theme with a red accent color.\nIf this theme does not work for the latest Firefox Version, please send me an email.\nOther accents available (request if not available).\nNOTE: ONLY WORKS ON FIREFOX DESKTOP.";
        platforms = platforms.all;
        };
      };
    "privacy-badger17" = buildFirefoxXpiAddon {
      pname = "privacy-badger17";
      version = "2020.2.19";
      addonId = "jid1-MnnxcxisBPnSXQ@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/3509922/privacy_badger-2020.2.19-an+fx.xpi?src=";
      sha256 = "4030aebff2e538e3cd637a7d2c5cea4d3f3817cc10e171891abd505ef67b5ac7";
      meta = with stdenv.lib;
      {
        homepage = "https://www.eff.org/privacybadger";
        description = "Automatically learns to block invisible trackers.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "ublock-origin" = buildFirefoxXpiAddon {
      pname = "ublock-origin";
      version = "1.25.0";
      addonId = "uBlock0@raymondhill.net";
      url = "https://addons.mozilla.org/firefox/downloads/file/3509800/ublock_origin-1.25.0-an+fx.xpi?src=";
      sha256 = "2c1becc2f25255e46cf4560c32ef196f9c95d4438c48e92282ce89251851d65f";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/gorhill/uBlock#ublock-origin";
        description = "Finally, an efficient blocker. Easy on CPU and memory.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "vimium-ff" = buildFirefoxXpiAddon {
      pname = "vimium-ff";
      version = "1.65.1";
      addonId = "{d7742d87-e61d-4b78-b8a1-b469842139fa}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3502765/vimium_ff-1.65.1-fx.xpi?src=";
      sha256 = "10afafcdb0e4ec64b8ccc96f9142a664807efc66fdafe83e2692fd7c7750b87c";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/philc/vimium";
        description = "The Hacker's Browser. Vimium provides keyboard shortcuts for navigation and control in the spirit of Vim.\n\nThis is a port of the popular Chrome extension to Firefox.\n\nMost stuff works, but the port to Firefox remains a work in progress.";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    }