# Nix-Darwin Configuration with Blueprint

This configuration uses [blueprint](https://github.com/numtide/blueprint) for modular flake management.

## Structure

```
.
├── flake.nix                           # Main flake (blueprint loader)
├── hosts/
│   └── whitecloudmacos/                # Host configuration
│       ├── darwin-configuration.nix    # Darwin system config
│       └── users/
│           └── phillychi3/
│               └── home-configuration.nix  # Home Manager config
└── modules/
    ├── darwin/                         # Darwin modules (auto-exported)
    │   ├── system-packages.nix         # System packages
    │   └── homebrew.nix                # Homebrew casks
    └── home/                           # Home Manager modules (auto-exported)
        └── rime-config.nix             # Rime input method config
```

## Blueprint Auto-Discovery

Blueprint automatically:
- Maps `hosts/whitecloudmacos/` → `darwinConfigurations.whitecloudmacos`
- Exports `modules/darwin/*.nix` → `darwinModules.*`
- Exports `modules/home/*.nix` → `homeModules.*`
- Integrates home-manager for `hosts/*/users/*/home-configuration.nix`

## Usage

### Build the configuration

```bash
nix build .#darwinConfigurations.whitecloudmacos.system
```

### Apply the configuration

```bash
darwin-rebuild switch --flake .#whitecloudmacos
```

### Update flake inputs

```bash
nix flake update
```

## Adding New Configurations

### Add a new system package

Create `modules/darwin/my-package.nix`:
```nix
{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.my-package ];
}
```

Then import it in `hosts/whitecloudmacos/darwin-configuration.nix`:
```nix
imports = [
  inputs.self.darwinModules.my-package
  # ...
];
```

### Add a new home configuration

Create `modules/home/my-config.nix`:
```nix
{ ... }: {
  home.file.".config/my-config".text = "...";
}
```

Then import it in `hosts/whitecloudmacos/users/phillychi3/home-configuration.nix`:
```nix
imports = [
  inputs.self.homeModules.my-config
  # ...
];
```

## Benefits

- ✅ **Modular**: Split configurations into logical modules
- ✅ **Reusable**: Share modules across multiple machines
- ✅ **Auto-discovery**: Blueprint handles flake outputs automatically
- ✅ **Clean**: No boilerplate in flake.nix
- ✅ **Organized**: Clear separation of system vs. user configs
