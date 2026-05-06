{ inputs, modulesPath, ... }: {
  imports = [
    "${modulesPath}/virtualisation/proxmox-lxc.nix"

    inputs.agenix.nixosModules.default

    inputs.self.nixosModules.base
    inputs.self.nixosModules.zerotier
    inputs.self.nixosModules.slock-daemon
  ];

  networking.hostName = "lxclab";
  time.timeZone = "Asia/Taipei";

  system.stateVersion = "25.11";
}
