{ buildFirefoxXpiAddon, fetchurl, stdenv }:
  {
    "https-everywhere" = buildFirefoxXpiAddon {
      pname = "https-everywhere";
      version = "2019.6.27";
      addonId = "https-everywhere@eff.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/3060290/https_everywhere-2019.6.27-an+fx.xpi?src=";
      sha256 = "37bb2155496910fdcf093c6f40d7871bd9605b4bd0200498b1c7c29b2ca4831c";
      meta = with stdenv.lib;
      {
        homepage = "https://www.eff.org/https-everywhere";
        description = "Encrypt the web! HTTPS Everywhere is a Firefox extension to protect your communications by enabling HTTPS encryption automatically on sites that are known to support it, even when you type URLs or follow links that omit the https: prefix.";
        platforms = platforms.all;
        };
      };
    "privacy-badger17" = buildFirefoxXpiAddon {
      pname = "privacy-badger17";
      version = "2019.10.8";
      addonId = "jid1-MnnxcxisBPnSXQ@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/3420722/privacy_badger-2019.10.8-an+fx.xpi?src=";
      sha256 = "14bb91f75b9886d7269e89fa5bfbe1032eb4f42c466ce80fbc61be8fd80bf4df";
      meta = with stdenv.lib;
      {
        homepage = "https://www.eff.org/privacybadger";
        description = "Automatically learns to block invisible trackers.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "vim-vixen" = buildFirefoxXpiAddon {
      pname = "vim-vixen";
      version = "0.25";
      addonId = "vim-vixen@i-beam.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/3421772/vim_vixen-0.25-an+fx.xpi?src=";
      sha256 = "1cc97e83d7fe90572b6e5344bc73ff022840cd90f029c69f6bf4d2eb5d6a436c";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/ueokande/vim-vixen";
        description = "Accelerates your web browsing with Vim power!!";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    }