{
  imports = [
    ./packages.nix
    ./godot.nix
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
