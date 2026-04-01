{
  description = "whitecloud nix-darwin system flake";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    # Blueprint for modular flake management
    blueprint.url = "github:numtide/blueprint";
    blueprint.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: inputs.blueprint {
    inherit inputs;
    
    # Define available systems
    systems = [ "aarch64-darwin" ];
    
    # Blueprint configuration
    prefix = "nix-darwin";
    nixpkgs.config = { };
    
    # Import modules from ./modules directory
    modules = ./modules;
  };
}
