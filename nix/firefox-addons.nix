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
      version = "2019.7.1.1";
      addonId = "jid1-MnnxcxisBPnSXQ@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/3285452/privacy_badger-2019.7.1.1-an+fx.xpi?src=";
      sha256 = "7bf4f0a7f527ac3d55f5917b994b2cbe2f4c907d57463f9bd8d04ffa82dc8dad";
      meta = with stdenv.lib;
      {
        homepage = "https://www.eff.org/privacybadger";
        description = "Automatically learns to block invisible trackers.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "tridactyl-vim" = buildFirefoxXpiAddon {
      pname = "tridactyl-vim";
      version = "1.16.2";
      addonId = "tridactyl.vim@cmcaine.co.uk";
      url = "https://addons.mozilla.org/firefox/downloads/file/3348489/tridactyl-1.16.2-an+fx.xpi?src=";
      sha256 = "5aadd08d0c557ae38d37a82534110585fa81e20c5068cfd09cd49be008cd6365";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/cmcaine/tridactyl";
        description = "Vim, but in your browser. Replace Firefox's control mechanism with one modelled on Vim.\n\nThis addon is very usable, but is in an early stage of development. We intend to implement the majority of Vimperator's features.";
        platforms = platforms.all;
        };
      };
    "ublock-origin" = buildFirefoxXpiAddon {
      pname = "ublock-origin";
      version = "1.21.2";
      addonId = "uBlock0@raymondhill.net";
      url = "https://addons.mozilla.org/firefox/downloads/file/3361355/ublock_origin-1.21.2-an+fx.xpi?src=";
      sha256 = "6c7ecdb7704963b83e03f9ada79d70a9af7486c1149f41edac3ed760fec0ed7a";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/gorhill/uBlock#ublock-origin";
        description = "Finally, an efficient blocker. Easy on CPU and memory.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    }
