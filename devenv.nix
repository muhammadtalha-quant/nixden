{
  pkgs,
  #lib,
  #config,
  #inputs,
  ...
}:

{
  packages = with pkgs; [
    statix
    nixfmt
  ];

  languages.nix = {
    enable = true;
    lsp.package = pkgs.nil;
  };
  scripts = {
    registerOnly.exec = "nh os boot";
    activateOnly.exec = "nh os test";
    registerAndActivate.exec = "nh os switch";
  };
}
