{ pkgs, inputs, ... }:

{
  # Import shared darwin modules
  imports = [
    inputs.self.darwinModules.system-packages
    inputs.self.darwinModules.homebrew
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  # Platform
  nixpkgs.hostPlatform = "aarch64-darwin";

  # User home directory
  users.users.phillychi3.home = /Users/phillychi3;

  # Nix settings
  nix = {
    enable = false;
    settings.experimental-features = "nix-command flakes";
  };

  # System configuration
  system = {
    configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
    stateVersion = 5;
    primaryUser = "phillychi3";
  };

  # nix-homebrew integration
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "phillychi3";
  };
}
