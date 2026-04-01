{ pkgs, lib, inputs, ... }:

{
  # Nix settings
  nix = {
    enable = false;
    settings.experimental-features = "nix-command flakes";
  };

  # System packages
  environment.systemPackages = with pkgs; [
    neovim
    eza
    netcat
    xz
    wget
    hyfetch
    yazi-unwrapped
  ];

  # System configuration
  system = {
    configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
    stateVersion = 5;
    primaryUser = "phillychi3";
  };

  # Platform
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Homebrew configuration
  homebrew = {
    enable = true;
    casks = [
      "discord"
      "squirrel-app"
    ];
  };

  # nix-homebrew integration
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "phillychi3";
  };
}
