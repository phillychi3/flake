{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source
    '';
    shellInit = ''
      fish_add_path /Users/phillychi3/.local/bin
    '';
  };
}
