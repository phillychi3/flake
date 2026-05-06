# whitecloud's flake




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
