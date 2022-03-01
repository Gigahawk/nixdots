{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    emacs-overlay.url = "github:nix-community/emacs-overlay/master";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, ... }@inputs: {
    nixosConfigurations = {
      nixosVbox = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./system.nix
          ./hardware.nix
          inputs.home-manager.nixosModules.home-manager
          { nixpkgs.overlays = [ inputs.emacs-overlay.overlay ]; }
        ];
      };
    }
  };
}
