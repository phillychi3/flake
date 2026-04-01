# Nix-Darwin Configuration

This configuration uses [blueprint](https://github.com/numtide/blueprint) for modular flake management.

## Structure

```
.
├── flake.nix              # Main flake file with blueprint integration
├── modules/
│   ├── default.nix        # Module aggregator
│   ├── darwin/            # Darwin-specific configurations
│   │   └── default.nix    # System packages, homebrew, nix settings
│   └── home/              # Home Manager configurations
│       └── default.nix    # User-specific settings
```

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

## Adding New Modules

1. Create a new `.nix` file in `modules/darwin/` or `modules/home/`
2. Import it in the respective `default.nix`
3. Rebuild the configuration

## Benefits of Blueprint

- **Modular**: Split configurations into logical modules
- **Reusable**: Share modules across multiple machines
- **Type-safe**: Better type checking and documentation
- **Organized**: Clear separation of concerns
