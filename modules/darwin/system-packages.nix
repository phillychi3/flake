{ pkgs, ... }:

{
  # System-wide packages
  environment.systemPackages = with pkgs; [
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
  ];
}
