let

  phillychi3 = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAFEdf7LvZpuU5NhPZ8Zvg1i9nKZVXiYb2RcQcoUKoxZ agenix@whitecloud"
  ];

  lxclab = [
  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDPlvNF0VA87I6CY3ewLbsuRs3ZvhBAf49hzsqIxk7tl root@nixos"];

  allKeys = phillychi3 ++ lxclab;
in
{
  "slock-daemon-api-key.age".publicKeys = allKeys;
}
