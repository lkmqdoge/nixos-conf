{ pkgs, ... }: {
  users = {
    users = {
      lkmqdoge = {
        isNormalUser = true;
        description = "lkmqdoge";
        extraGroups = ["networkmanager" "wheel" "audio" "input"];
        shell = pkgs.fish;
        uid = 1000;
      };
    };
  };

  programs.fish.enable = true;
}
