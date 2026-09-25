{ pkgs, inputs, ... }:

{
  # System-wide packages
  environment.systemPackages = with pkgs; [
    inputs.herdr.packages.${pkgs.system}.default
    temurin-bin-21
    neovim
    eza
    netcat
    xz
    wget
    hyfetch
    yazi-unwrapped
    gh
    nodejs
    pnpm
    ni
    pay-respects
    zoxide
    go
    rustup
    python3
    poetry
    uv
  ];
}
