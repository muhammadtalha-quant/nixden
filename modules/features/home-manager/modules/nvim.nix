{
  programs.lazyvim = {
    enable = true;
    ignoreBuildNotifications = true;
    extras.lang = {
      nix.enable = true;
      markdown.enable = true;
      clangd.enable = true;
      cmake.enable = true;
      python.enable = true;
      json.enable = true;
      toml.enable = true;
      sql.enable = true;
      typst.enable = true;
      yaml.enable = true;
    };
    configFiles = ../dotfiles/lazyvim;
  };
}
