{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source
      pay-respects --shell-alias fuck init fish | source
      zoxide init fish | source
    '';
    shellInit = ''
      fish_add_path /Users/phillychi3/.local/bin
      fish_add_path /etc/profiles/per-user/phillychi3/bin
      fish_add_path /run/current-system/sw/bin
      fish_add_path /nix/var/nix/profiles/default/bin
    '';
  };
}
