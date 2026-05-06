{ pkgs, config, lib, ... }:

let
  # daemon 可以呼叫的工具集
  daemonTools = lib.makeBinPath [
    pkgs.nodejs_22
    pkgs.opencode
    pkgs.git
    pkgs.curl
    pkgs.bash
    pkgs.coreutils
  ];
in
{
  age.secrets.slock-daemon-api-key = {
    file = ../../secrets/slock-daemon-api-key.age;
    owner = "slock-daemon";
    group = "slock-daemon";
    mode = "0400";
  };

  users.users.slock-daemon = {
    isSystemUser = true;
    group = "slock-daemon";
    home = "/var/lib/slock-daemon";
    createHome = true;
    description = "slock-ai daemon service user";
  };
  users.groups.slock-daemon = {};

  systemd.services.slock-daemon = {
    description = "slock-ai daemon";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];

    path = [
      pkgs.nodejs_22
      pkgs.opencode
      pkgs.git
      pkgs.curl
      pkgs.bash
      pkgs.coreutils
      # claude-code 是 npm global 裝的，路徑在 /var/lib/slock-daemon/.npm-global/bin
      "/var/lib/slock-daemon/.npm-global"
    ];

    serviceConfig = {
      User = "slock-daemon";
      Group = "slock-daemon";
      Restart = "always";
      RestartSec = "10s";
      WorkingDirectory = "/var/lib/slock-daemon";

      Environment = [
        "npm_config_cache=/var/lib/slock-daemon/.npm"
        "npm_config_prefix=/var/lib/slock-daemon/.npm-global"
        "HOME=/var/lib/slock-daemon"
      ];

      ExecStart = pkgs.writeShellScript "slock-daemon-start" ''
        export PATH="${daemonTools}:/var/lib/slock-daemon/.npm-global/bin:$PATH"
        exec ${pkgs.nodejs_22}/bin/npx --yes @slock-ai/daemon@latest \
          --server-url https://api.slock.ai/ \
          --api-key "$(cat ${config.age.secrets.slock-daemon-api-key.path})"
      '';

      NoNewPrivileges = true;
      PrivateTmp = true;
      ProtectHome = false;  # daemon 需要存取工作目錄
      ReadWritePaths = [ "/var/lib/slock-daemon" ];
    };
  };


  systemd.services.slock-daemon-setup = {
    description = "Install claude-code for slock-daemon";
    wantedBy = [ "multi-user.target" ];
    before = [ "slock-daemon.service" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];


    unitConfig.ConditionPathExists = "!/var/lib/slock-daemon/.npm-global/bin/claude";

    serviceConfig = {
      Type = "oneshot";
      User = "slock-daemon";
      Group = "slock-daemon";
      WorkingDirectory = "/var/lib/slock-daemon";
      Environment = [
        "npm_config_cache=/var/lib/slock-daemon/.npm"
        "npm_config_prefix=/var/lib/slock-daemon/.npm-global"
        "HOME=/var/lib/slock-daemon"
      ];
      ExecStart = "${pkgs.nodejs_22}/bin/npm install -g @anthropic-ai/claude-code@latest";
    };
  };
}
