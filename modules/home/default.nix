{ lib, ... }:

{
  home.username = "phillychi3";
  home.homeDirectory = lib.mkForce "/Users/phillychi3";
  home.stateVersion = "24.11";

  # Rime input method configuration
  home.file."Library/Rime/default.custom.yaml".text = ''
    patch:
      schema_list:
        - schema: bopomofo
  '';
}
