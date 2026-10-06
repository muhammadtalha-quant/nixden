{ lib, den, ... }: {

  # use the hostname as defined using the den.hosts entity.
  den.default.includes = [ den.batteries.hostname ];

  # enable home manager for all users by default.
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
}
