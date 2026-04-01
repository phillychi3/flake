{ inputs, ... }:

{
  # Import darwin modules
  imports = [
    ./darwin
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  # Home Manager configuration
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.phillychi3 = import ./home;
  };
}
