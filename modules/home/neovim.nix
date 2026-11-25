{ config, pkgs, ... }:

let
  # Lua config lives in this repo and is symlinked (not copied into the store),
  # so edits take effect immediately without `darwin-rebuild switch`.
  nvimConfigDir = "${config.home.homeDirectory}/.config/nix-darwin/dotfiles/nvim";
in
{
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink nvimConfigDir;

  # LSP servers & tooling are provided by nix instead of mason.
  home.packages = with pkgs; [
    # Plugin / editor deps
    tree-sitter # nvim-treesitter (main branch) compiles parsers with this
    ripgrep
    fd
    lazygit

    # Lua
    lua-language-server
    stylua

    # TypeScript / JavaScript / Web / Svelte
    vtsls
    vscode-langservers-extracted # eslint, css, html, json
    tailwindcss-language-server
    svelte-language-server
    typescript

    # Python
    basedpyright
    ruff

    # Go
    gopls

    # Rust
    rust-analyzer

    # Nix
    nixd
    nixfmt

    # Shell
    bash-language-server
    shellcheck
    shfmt
  ];
}
