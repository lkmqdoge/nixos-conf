{
  programs.nixvim.plugins.web-devicons.enable = true;
  programs.nixvim.plugins.neo-tree = {
    enable = true;
    closeIfLastWindow = true;

    filesystem = {
      followCurrentFile.enabled = true;
      filteredItems = {
        hideDotfiles = false;
        hideGitignored = false;
      };
    };
  };
}
