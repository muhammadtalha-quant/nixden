{ lib, den, ... }: {
  den.default.includes = [ den.batteries.hostname ];

  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
}
