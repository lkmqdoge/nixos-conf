{ pkgs, ... }:
{
  # enable docker
  virtualisation = {
    docker = {
      enable = true;
    };
    podman.enable = true;
  };
  users.groups.docker.members = [ "lkmqdoge" ];

  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)
    # core utils 
    gnumake
    just
    fd # simple and fast alternative to find

    ventoy

    # editor
    neovim
    vim

    # vcs
    git
    gh # github cli tool
    git-lfs

    # archives
    unrar
    unzip 

    # text proccesing
    gnused # replacing text in files
    sad    # search and replace, just like sed, but with diff preview
    jq
    jc

    w3m      # tui internet browser
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
