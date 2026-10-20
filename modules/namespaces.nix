{ inputs, ... }: {

  imports = [
    (inputs.den.namespace "disko" false)
    (inputs.den.namespace "nvf" false)
  ];
}
