{pkgs, ...}: {
  programs.vscode = {
    profiles.default = {
      enable = true;
      package = pkgs.vscode;

      userSettings = {
        "editor.minimap.enabled" = false;
        "workbench.colorTheme" = "GitHub Dark High Contrast";
        "workbench.editor.pinnedTabsOnSeparateRow" = true;
        "window.density.editorTabHeight" = "compact";
        "workbench.editor.empty.hint" = "hidden";
        "workbench.activityBar.location" = "top";
        "editor.glyphMargin" = false;
        "editor.fontLigatures"= true;
        "editor.letterSpacing" = 0.7;
        "editor.fontFamily" = "JetBrainsMono Nerd Font";
        "C_Cpp.inlayHints.parameterNames.suppressWhenArgumentContainsName" = false;
        "C_Cpp.inlayHints.parameterNames.hideLeadingUnderscores" = false;
        "editor.inlayHints.enabled" = "off";
      };

      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        oops418.nix-env-picker
        jdinhlife.gruvbox
        github.github-vscode-theme
        vscodevim.vim
        ms-dotnettools.csdevkit
        ms-vscode.cpptools-extension-pack
        twxs.cmake
        ms-vscode.cmake-tools
      ];
    };
  };
}
