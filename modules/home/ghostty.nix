{ ... }:

{
  home.file.".config/ghostty/config".text = ''
    # Default shell
    command = /etc/profiles/per-user/phillychi3/bin/fish

    # Theme
    theme = TokyoNight

    # Background
    background-opacity = 0.85
    background-blur-radius = 16
  '';
}
