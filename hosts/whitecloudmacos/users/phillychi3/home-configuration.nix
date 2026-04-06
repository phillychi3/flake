{ lib, inputs, ... }:

{
  # Import shared home modules
  imports = [
    inputs.self.homeModules.rime-config
    inputs.self.homeModules.starship
    inputs.self.homeModules.fish
    inputs.self.homeModules.fonts
  ];

  home.username = "phillychi3";
  home.homeDirectory = lib.mkForce "/Users/phillychi3";
  home.stateVersion = "24.11";
}
