{ ... }:

{
  # Herdr terminal-multiplexer config (managed declaratively)
  home.file.".config/herdr/config.toml".text = ''
    [terminal]
    default_shell = "fish"
  '';
}
