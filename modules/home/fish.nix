{ pkgs, config, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      e = "eza --icons -l";
    };
    interactiveShellInit = ''
      starship init fish | source
      pay-respects --shell-alias fuck init fish | source
      zoxide init fish | source
    '';
    shellInit = ''
      # === Nix / system ===
      fish_add_path /run/current-system/sw/bin
      fish_add_path /nix/var/nix/profiles/default/bin
      fish_add_path /etc/profiles/per-user/${config.home.username}/bin

      # === Homebrew ===
      fish_add_path /opt/homebrew/bin
      fish_add_path /opt/homebrew/sbin

      # === Generic user bin ===
      # uv tool install / pipx / cargo (部分) 都會裝這裡
      fish_add_path ${config.home.homeDirectory}/.local/bin
      fish_add_path ${config.home.homeDirectory}/bin

      # === Language package managers ===
      # Rust (cargo / rustup)
      fish_add_path ${config.home.homeDirectory}/.cargo/bin

      # Go
      set -gx GOPATH ${config.home.homeDirectory}/go
      fish_add_path $GOPATH/bin

      # Node (npm global / pnpm / bun / deno)
      fish_add_path ${config.home.homeDirectory}/.npm-global/bin
      set -gx PNPM_HOME ${config.home.homeDirectory}/Library/pnpm
      fish_add_path $PNPM_HOME
      fish_add_path ${config.home.homeDirectory}/.bun/bin
      fish_add_path ${config.home.homeDirectory}/.deno/bin

      # Ruby (gem install --user-install) — 掃所有版本
      for gem_bin in ${config.home.homeDirectory}/.gem/ruby/*/bin
          fish_add_path $gem_bin
      end

      # Java / SDKMAN
      fish_add_path ${config.home.homeDirectory}/.sdkman/candidates/java/current/bin
    '';
  };
}
