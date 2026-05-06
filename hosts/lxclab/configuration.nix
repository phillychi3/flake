{ inputs, modulesPath, ... }: {
  imports = [
    "${modulesPath}/virtualisation/proxmox-lxc.nix"

    inputs.self.nixosModules.base
    inputs.self.nixosModules.zerotier
  ];
  nixpkgs.hostPlatform = "x86_64-linux";
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "lxclab";
  time.timeZone = "Asia/Taipei";

  system.stateVersion = "25.11";
}
