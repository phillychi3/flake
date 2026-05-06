{ inputs, modulesPath, ... }: {
  imports = [
    "${modulesPath}/virtualisation/proxmox-lxc.nix"

    inputs.self.nixosModules.base
    inputs.self.nixosModules.zerotier
  ];

  networking.hostName = "lxclab";
  time.timeZone = "Asia/Taipei";

  system.stateVersion = "25.11";
}
