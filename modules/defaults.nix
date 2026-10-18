{
  inputs,
  lib,
  den,
  ...
}:
{
  den = {
    default = {
      includes = [
        den.batteries.hostname
        den.batteries.define-user
      ];

      nixos = { host, ... }: {
        imports = [
          inputs.home-manager.nixosModules.home-manager
        ];
        nixpkgs.config.allowUnfree = lib.mkDefault false;
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
        };
        system.stateVersion = host.stateVersion;
      };
      homeManager = { host, ... }: {
        home.stateVersion = host.stateVersion;
      };
    };

    schema.user.classes = lib.mkDefault [ "homeManager" ];
    schema.host.includes = [ den.aspects.nixos-core ];
  };
}
