{pkgs, ...}: {
  home.packages = with pkgs; [
    godot-mono
    godot_4-export-templates
    gdtoolkit_4
  ];
}
