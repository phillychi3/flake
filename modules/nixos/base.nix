{ pkgs, ... }: {
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.PermitRootLogin = "prohibit-password";
  };

  users.users.phillychi3 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKDhr+cPPKcZHHiU5ZGtNr5vqtKIqsDQ1451epVEPRWj #ssh.id - @phillychi3"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMyzoDzkQZi4Fe59Lyxg9oZG3PHZKEC3fOObRw6T8O4x #ssh.id - @phillychi3"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDAEe984mMsMeTFpBxm7qtyP5W4DbI3fnFAAWwoR0FOc #ssh.id - @phillychi3"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIoPw6kH5KO3IAspCVbP7nY6iAHEjY6FPlNa5x8wAV3I #ssh.id - @phillychi3"
    ];
  };

  security.sudo.wheelNeedsPassword = false;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.nix-ld.enable = true;

  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    historyLimit = 10000;
    keyMode = "vi";
    escapeTime = 0;
    baseIndex = 1;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      pain-control
      tokyo-night-tmux
    ];

    extraConfig = ''
      # True color support
      set -ag terminal-overrides ",xterm-256color:RGB"

      # Mouse support
      set -g mouse on

      # Prefix: Ctrl-a
      unbind C-b
      set -g prefix C-a
      bind C-a send-prefix

      # Reload config
      bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"

      # Split panes with current path
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      unbind '"'
      unbind %

      # New window with current path
      bind c new-window -c "#{pane_current_path}"

      # Pane index starts at 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      # Status bar on top
      set -g status-position top
    '';
  };

  environment.systemPackages = with pkgs; [
    git vim curl htop
    nodejs_22
    opencode
  ];
}
