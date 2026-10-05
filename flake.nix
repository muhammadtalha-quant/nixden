{
  description = "A very scalable NixOS Configuration based on den library.";

  inputs = {
    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
      url = "github:hercules-ci/flake-parts";
    };
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    nixpkgs-lib.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    den.url = "github:denful/den";
    import-tree.url = "github:denful/import-tree";
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lazyvim = {
      url = "github:pfassina/lazyvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
  #outputs =
  #  {
  #    self,
  #    nixpkgs,
  #    home-manager,
  #    disko,
  #    ...
  #  }@inputs:
  #  let
  #    hosts = {
  #      hpProbook430G2 = {
  #        hostName = "hp-probook-430g2";
  #        stateVersion = "26.05";
  #        timeZone = "Asia/Karachi";
  #        diskoConfig = {
  #          device = "/dev/sda";
  #          swapSize = "4G";
  #        };
  #      };
  #    };

  #    users = {
  #      root.hashedPassword = "$y$j9T$CXXX951qyBSRGHfHxZ8E01$ooy/jGSGAqWqdNQ0WA9pMbjibDGYoA2jsmDU8GJhbv2";
  #      primary = {
  #        userName = "muhammadtalha";
  #        realName = "Muhammad Talha";
  #        hashedPassword = "$y$j9T$T/fyOwJSnwDN5vhbYvxOU0$xWmn12BoAIyDVChelEt7LyhGHQTMlJjd/5OEuy6Ud65";
  #        emailAddress = "muhammadtalha.quant@gmail.com";
  #        gpgKey = "33DF23031DE1A83C";
  #      };
  #    };
  #    # !=== ENVIRONMENT CONFIG ===!
  #    configDirectory = "/home/${users.primary.userName}/nucleonix/";
  #  in
  #  {
  #    diskoConfigurations = {
  #      ${hosts.hpProbook430G2.hostName} =
  #        import ./modules/common/disko/ext4-unencrypted.nix hosts.hpProbook430G2;
  #    };
  #    nixosConfigurations = {
  #      ${hosts.hpProbook430G2.hostName} =
  #        let
  #          currentHost = hosts.hpProbook430G2;
  #        in
  #        nixpkgs.lib.nixosSystem {
  #          inherit
  #            (
  #              (builtins.fromJSON (builtins.readFile ./modules/hosts/${currentHost.hostName}/hardware_report.json))
  #            )
  #            system
  #            ;
  #          specialArgs = {
  #            inherit inputs;
  #            inherit configDirectory;
  #            inherit users;
  #            inherit currentHost;
  #            inherit (currentHost) diskoConfig;
  #          };
  #          modules = [
  #            ./modules/common/nixos-core/core.nix
  #            ./modules/features/hyprland-de/hyprland-de.nix
  #            #./modules/features/virtualisation/virtualisation.nix
  #            ./modules/hosts/${currentHost.hostName}/default.nix
  #            home-manager.nixosModules.home-manager
  #            ./modules/features/home-manager/decl.nix
  #            disko.nixosModules.disko
  #            ./modules/common/disko/ext4-unencrypted.nix
  #          ];
  #        };
  #    };
  #  };
}
