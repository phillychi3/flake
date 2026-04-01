{ ... }:

{
  # Rime input method configuration
  home.file."Library/Rime/default.custom.yaml".text = ''
    patch:
      schema_list:
        - schema: bopomofo
  '';
}
