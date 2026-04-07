{ ... }:

{
  home.file.".config/ghostty/config".text = ''
    # Default shell
    command = /etc/profiles/per-user/phillychi3/bin/fish
  '';
}
