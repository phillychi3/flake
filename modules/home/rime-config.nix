{ pkgs, ... }:

let
  iridium-bpmf = pkgs.fetchFromGitHub {
    owner = "andy0130tw";
    repo = "iridium-bpmf";
    rev = "38c1f8b1d1d5d819c410d26ae7f3d90f7e305498";
    sha256 = "1w6g16f6zvdxzp6z0y59yg7yyf9wm8648f7sk9amj45nxyh3wnqq";
  };
in
{
  # iridium-bpmf schema files
  home.file."Library/Rime/iridium_bpmf.schema.yaml".source =
    "${iridium-bpmf}/iridium_bpmf.schema.yaml";
  home.file."Library/Rime/iridium_bpmf_ext.dict.yaml".source =
    "${iridium-bpmf}/iridium_bpmf_ext.dict.yaml";
  home.file."Library/Rime/iridium_bpmf_phrase.txt".source =
    "${iridium-bpmf}/iridium_bpmf_phrase.txt";
  home.file."Library/Rime/mcbopomofo.dict.yaml".source =
    "${iridium-bpmf}/mcbopomofo.dict.yaml";

  # Patch iridium_bpmf schema directly to disable all switch keys
  home.file."Library/Rime/iridium_bpmf.custom.yaml".text = ''
    patch:
      ascii_composer:
        good_old_caps_lock: false
        switch_key:
          Caps_Lock: noop
          Shift_L: noop
          Shift_R: noop
          Control_L: noop
          Control_R: noop
          Eisu_toggle: noop
  '';

  # Enable iridium_bpmf schema
  home.file."Library/Rime/default.custom.yaml".text = ''
    patch:
      schema_list:
        - schema: iridium_bpmf
      key_binder/bindings:
        - { when: has_menu, accept: Up, send: Page_Up }
        - { when: has_menu, accept: Down, send: Page_Down }
        - { when: has_menu, accept: Left, send: Up }
        - { when: has_menu, accept: Right, send: Down }
      switcher/option_list_separator: ' / '
      switcher/save_options:
        - full_shape
        - ascii_punct
        - simplification
        - extended_charset
        - zh_hant
        - zh_hans
        - zh_hant_tw
      ascii_composer:
        good_old_caps_lock: false
        switch_key:
          Caps_Lock: noop
          Shift_L: noop
          Shift_R: noop
          Control_L: noop
          Control_R: noop
          Eisu_toggle: noop
  '';
}
