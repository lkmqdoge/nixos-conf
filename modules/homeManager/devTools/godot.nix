{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit (pkgs)

    godot-mono
    godot_4-export-templates-bin
    gdtoolkit_4
    ;
  };
}
