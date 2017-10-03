{ pkgs, ... }:

{
  networking.networkmanager.enable = true;

  time.timeZone = "Pacific/Auckland";

  environment.systemPackages = with pkgs; [
    emacs git
  ];

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
  
  services.xserver = {
    enable = true;
    autorun = true;

    desktopManager.default = "none";
    windowManager = {
      default = "i3";
      i3 = {
        enable = true;
      };
    };
    displayManager.slim = {
      enable = true;
      defaultUser = "utdemir";
      autoLogin = true;
    };

    synaptics = {
      enable = true;
    };
  };

  hardware.pulseaudio.enable = true;

  users.extraUsers.utdemir = {
    home = "/home/utdemir";
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    shell = "${pkgs.zsh}/bin/zsh";
  };

  system.stateVersion = "17.03";
}
