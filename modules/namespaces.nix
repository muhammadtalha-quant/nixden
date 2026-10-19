{ inputs, ... }: {

  imports = [
    (inputs.den.namespace "diskoConfigurations" true)
    (inputs.den.namespace "lazynvf" false)
  ];
}
