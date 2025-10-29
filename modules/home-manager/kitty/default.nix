{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    settings = {
      # it does not fucking work
      theme = "FishTank";
    };
  };
}
