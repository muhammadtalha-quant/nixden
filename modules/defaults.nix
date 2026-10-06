{ lib, den, ... }: {

  # use the hostname as defined using the den.hosts entity.
  # also automatically define user when found inside host entity object.
  den.default.includes = [
    den.batteries.hostname
    den.batteries.define-user
  ];

  # enable home manager for all users by default.
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
}
