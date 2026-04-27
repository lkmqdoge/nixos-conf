{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit (pkgs)

    godot-mono
    godot
    godot_4-export-templates-bin

    # tools
    godotpcktool # tool for exploring .pck files
    gdtoolkit_4  # linter formatter
    ;
  };
}
