{ pkgs, config, ... }: {

  age.secrets.slock-daemon-api-key = {
    file = ../../secrets/slock-daemon-api-key.age;
    owner = "slock-daemon";
    group = "slock-daemon";
    mode = "0400";
  };

  users.users.slock-daemon = {
    isSystemUser = true;
    group = "slock-daemon";
    description = "slock-ai daemon service user";
  };
  users.groups.slock-daemon = {};

  systemd.services.slock-daemon = {
    description = "slock-ai daemon";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      User = "slock-daemon";
      Group = "slock-daemon";
      Restart = "always";
      RestartSec = "10s";

      ExecStart = pkgs.writeShellScript "slock-daemon-start" ''
        exec ${pkgs.nodejs_22}/bin/npx @slock-ai/daemon@latest \
          --server-url https://api.slock.ai/ \
          --api-key "$(cat ${config.age.secrets.slock-daemon-api-key.path})"
      '';

      NoNewPrivileges = true;
      PrivateTmp = true;
      ProtectSystem = "strict";
      ProtectHome = true;
    };
  };
}
