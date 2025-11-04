{ pkgs, ... }:
{
  environment.variables.EDITOR = "nvim --clean";
  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)

    # editor
    neovim
    vim

    # vcs
    git
    git-lfs

    # archives
    unrar
    unzip 

    # tui internet browser
    w3m  

    # dead disk reading
    testdisk

    dig

    gnumake

    home-manager;
  };
}
