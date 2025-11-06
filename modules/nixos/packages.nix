{ pkgs, ... }:
{
  environment.variables.EDITOR = "nvim --clean";
  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)
    # core utils 
    gnumake
    just

    # editor
    neovim
    vim

    # vcs
    git
    git-lfs

    # archives
    unrar
    unzip 

    # text proccesing
    gnused # replacing text in files
    sad # search and replace, just like sed, but with diff preview
    jq
    jc

    w3m # tui internet browser
    testdisk # dead disk reading

    procs
    btop

    # networking tools
    tcpdump
    nmap
    mtr # a network diagnostic tool (traceroute)
    gping # ping, but with graph
    dnsutils # dig + nslookup
    wget
    curl
    iperf3 # network performance test


    home-manager

    # misc 
    tree
    tealdeer # tldr
    ;
  };
}
