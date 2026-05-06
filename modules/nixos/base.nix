{ pkgs, ... }: {
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.PermitRootLogin = "prohibit-password";
  };

  users.users.phillychi3 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKDhr+cPPKcZHHiU5ZGtNr5vqtKIqsDQ1451epVEPRWj #ssh.id - @phillychi3"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMyzoDzkQZi4Fe59Lyxg9oZG3PHZKEC3fOObRw6T8O4x #ssh.id - @phillychi3"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDAEe984mMsMeTFpBxm7qtyP5W4DbI3fnFAAWwoR0FOc #ssh.id - @phillychi3"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIoPw6kH5KO3IAspCVbP7nY6iAHEjY6FPlNa5x8wAV3I #ssh.id - @phillychi3"
    ];
  };

  security.sudo.wheelNeedsPassword = false;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    git vim curl htop
    nodejs_22
  ];
}
