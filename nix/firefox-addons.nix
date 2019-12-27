{ buildFirefoxXpiAddon, fetchurl, stdenv }:
  {
    "decentraleyes" = buildFirefoxXpiAddon {
      pname = "decentraleyes";
      version = "2.0.13";
      addonId = "jid1-BoFifL9Vbdl2zQ@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/3423038/decentraleyes-2.0.13-an+fx.xpi?src=";
      sha256 = "9dd1aa4e752166fb13ddc06068cf4c1aacc7e2789128fa103cf81285818943ea";
      meta = with stdenv.lib;
      {
        homepage = "https://decentraleyes.org";
        description = "Protects you against tracking through \"free\", centralized, content delivery. It prevents a lot of requests from reaching networks like Google Hosted Libraries, and serves local files to keep sites from breaking. Complements regular content blockers.";
        license = licenses.mpl20;
        platforms = platforms.all;
        };
      };
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
      version = "2019.12.4";
      addonId = "{a7589411-c5f6-41cf-8bdc-f66527d9d930}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3462016/matte_black_red-2019.12.4-an+fx.xpi?src=";
      sha256 = "06830f1f82265826d86666932eec0fe996c6cf8443305bd6302f372708866fb4";
      meta = with stdenv.lib;
      {
        homepage = "https://elijahlopez.herokuapp.com/";
        description = "A modern dark / Matte Black theme with a red accent color.\nIf this theme does not work for the latest Firefox Version, please send me an email.\nOther accents available (request if not available).\nNOTE: ONLY WORKS ON FIREFOX DESKTOP.";
        platforms = platforms.all;
        };
      };
    "privacy-badger17" = buildFirefoxXpiAddon {
      pname = "privacy-badger17";
      version = "2019.11.18";
      addonId = "jid1-MnnxcxisBPnSXQ@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/3448925/privacy_badger-2019.11.18-an+fx.xpi?src=";
      sha256 = "1ffa75044528f312b282f61cfab7520c006416771e85a63644a1bf528591129d";
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
      version = "1.24.2";
      addonId = "uBlock0@raymondhill.net";
      url = "https://addons.mozilla.org/firefox/downloads/file/3452970/ublock_origin-1.24.2-an+fx.xpi?src=";
      sha256 = "bea5a60d423ffd1c1a860ad34a249b4f12c9711f525022f54325c51c52e4524e";
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
      version = "1.64.6";
      addonId = "{d7742d87-e61d-4b78-b8a1-b469842139fa}";
      url = "https://addons.mozilla.org/firefox/downloads/file/2985278/vimium_ff-1.64.6-fx.xpi?src=";
      sha256 = "7044bd3983e541faf2e56c117048fdc281c4c52e4196472fc4f9e4af42c5e1da";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/philc/vimium";
        description = "The Hacker's Browser. Vimium provides keyboard shortcuts for navigation and control in the spirit of Vim.\n\nThis is a port of the popular Chrome extension to Firefox.\n\nMost stuff works, but the port to Firefox remains a work in progress.";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    }
