{ pkgs, ... }:

{
  imports = [ ./patches/multi-glibc-locale-paths.nix ];
  nixpkgs.config.allowUnfree = true;
  networking.networkmanager.enable = true;

  time.timeZone = "Pacific/Auckland";

  environment.systemPackages = with pkgs; [
    vim git home-manager
  ];

  boot.kernel.sysctl = {
    "vm.swappiness" = 0; 
    "fs.inotify.max_user_watches" = 2048000;
  };

  boot.cleanTmpDir = true;

  services.openssh.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
  };

  virtualisation.docker = {
    enable = true;
    liveRestore = false;
    # autoPrune.enable = true;
  };

  services.logind.lidSwitch = "ignore";

  services.xserver = {
    enable = true;
    autorun = true;
    displayManager.slim = {
      enable = true;
      defaultUser = "utdemir";
      autoLogin = true;
    };

    synaptics.enable = true;
  };

  services.earlyoom = {
    enable = true;
    freeMemThreshold = 5;
  };

  services.clamav = {
    daemon.enable = true;
    updater.enable = true;
  };

  hardware.pulseaudio.enable = true;
  hardware.opengl.driSupport32Bit = true;

  users.extraUsers.utdemir = {
    home = "/home/utdemir";
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    shell = "${pkgs.zsh}/bin/zsh";
  };

  system.stateVersion = "17.09";
}
