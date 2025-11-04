{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "csharp"
      "java"
      "nix"
      "lua"
      "sql"
      "neocmake"
      "make"
      "html"
      "shader-ls"
    ];
    userSettings = {
      features = {
        copilot = false;
      };

      telemetry = {
        metrics = false;
      };

      vim_mode = true;
    };
  };
}
