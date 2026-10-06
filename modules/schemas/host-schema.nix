{
  den.schema.host = { lib, host, ... }: {
    options = {
      stateVersion = lib.mkOption {
        type = lib.typs.str;
        default = "";
      };
      timeZone = lib.mkOption {
        type = lib.typs.str;
        default = "";
      };
      disko = lib.mkOption {
        type = lib.types.submodule {
          options = {
            device = lib.mkOption {
              type = lib.types.str;
              default = "";
            };
            swapSize = lib.mkOption {
              type = lib.types.str;
              default = "4G";
            };
          };
        };
      };
    };
  };
}
