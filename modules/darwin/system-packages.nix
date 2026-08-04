{ pkgs, inputs, ... }:

{
  # System-wide packages
  environment.systemPackages = with pkgs; [
    inputs.herdr.packages.${pkgs.system}.default
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
