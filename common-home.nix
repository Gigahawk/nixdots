{...}:

let pkgs = import ./pkgs.nix;
in

{
  home.packages = with pkgs; [
    # WM
    i3 i3status i3lock feh dmenu rofi unclutter autorandr
    arandr compton maim networkmanagerapplet parcellite
    lxappearance xfontsel ubuntu_font_family source-code-pro
    pasystray pavucontrol xdotool kitty

    # Apps
    firefox qutebrowser chromium
    libreoffice dia gimp
    spotify smplayer mplayer audacity

    qiv  zathura inotify-tools
    scrot xsel xclip peek

    # CLI
    zsh oh-my-zsh
    ranger bashmount imagemagick pdftk ncdu htop tree units
    ascii powertop ghostscript translate-shell nload siege
    asciinema zip unzip file dos2unix findutils coreutils
    watch graphviz rsync parallel openssl entr gnupg keybase
    gitAndTools.hub pv jq ripgrep tree autojump ncdu htop cloc
    units haskellPackages.lentil haskellPackages.pandoc curl
    wget hexedit docker_compose mtr nmap cmatrix awscli
    pass-otp zbar

    (import ./lib/mk-scripts.nix { inherit pkgs; } ./scripts)

    # editors
    (vim_configurable.customize {
      name = "vi";
      vimrcConfig = {
        vam.knownPlugins = vimPlugins;
        vam.pluginDictionaries = [
          { names = [
            "vim-addon-nix"
            "molokai"
          ];}
        ];
        customRC = (builtins.readFile ./dotfiles/vimrc);
      };
    })
    (import ./lib/mk-emacs.nix { inherit pkgs; } ./dotfiles/emacs.el)

    # haskell
    stack cabal2nix

    # c
    gcc gnumake

    # scala
    openjdk8 (sbt.override { jre = jre8; })

    # sh
    haskellPackages.ShellCheck

    # python
    python2 python3
    python3Packages.virtualenv python3Packages.black

    # rust
    rustc cargo carnix

    # prolog
    swiProlog

    # coq
    coq

    # nix
    nix-repl nix-prefetch-scripts
  ];

  programs.git = {
    enable = true;
    userName = "Utku Demir";
    userEmail = "me@utdemir.com";
    signing = {
      signByDefault = true;
      key = "76CCC3C7A7398C1321F5438BF3F8629C3E0BF60B";
      gpgPath = "gpg";
    };
  };

  services.gpg-agent.enable = true;

  xsession = {
    enable = true;
    windowManager.command = "${pkgs.i3}/bin/i3";
    profileExtra = ''
    export SBT_OPTS="-Xms512M -Xmx1024M -Xss2M -XX:MaxMetaspaceSize=1024M"
    '';
  };

  services.keybase.enable = true;
  manual.manpages.enable = false;

  home.file.".stack/config.yaml".source = ./dotfiles/stack;
  
  home.file.".config/i3/config".source = ./dotfiles/i3/config;
  home.file.".config/i3/autostart.sh".source = ./dotfiles/i3/autostart.sh;
  home.file.".config/i3status/config".source = ./dotfiles/i3/i3status;

  home.file.".config/kitty/kitty.conf".source = ./dotfiles/kitty.conf;

  home.file.".config/qutebrowser/config.py".source = ./dotfiles/qutebrowser/config.py;
  home.file.".config/qutebrowser/bookmarks/urls".source =
    ./dotfiles/qutebrowser/bookmarks;

  home.file.".Xdefaults".source = ./dotfiles/Xdefaults;
  
  home.file.".zshrc".source = ./dotfiles/zshrc;
  home.file.".zsh_custom/utdemir.zsh-theme".source = ./dotfiles/zsh_custom/utdemir.zsh-theme;

  home.file.".emacs.el".source = ./dotfiles/emacs.el;
  home.file.".emacs.d/snippets".source = ./dotfiles/emacs.d/snippets;
}
