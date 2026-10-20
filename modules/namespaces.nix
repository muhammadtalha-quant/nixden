{ inputs, ... }: {

  imports = [
    (inputs.den.namespace "disko" false)
    (inputs.den.namespace "de" false)
    (inputs.den.namespace "neovim" false)
    (inputs.den.namespace "themes" false)
  ];
}
