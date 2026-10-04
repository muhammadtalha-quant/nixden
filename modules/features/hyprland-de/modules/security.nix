{
  security = {
    rtkit.enable = true;
    pam.services.greetd = {
      enableGnomeKeyring = true;
      fprintAuth = true;
    };
  };
}
