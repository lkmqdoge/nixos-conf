{ pkgs, lib, ... }:
let
  inherit (lib) mkMerge;

  buildDotnetGlobalTool = pkgs.dotnetCorePackages.buildDotnetGlobalTool;
  easy-dotnet = buildDotnetGlobalTool {
    pname = "EasyDotnet";
    executables = [ "dotnet-easydotnet" ]; 
    version = "3.1.3-alpha.3";
    nugetHash = "sha256-i9dw3sIHwGPre21cO/KROkoJ+1HwOwgUptQF03D5B8A=";

    meta = {
      description = "Easy Dotnet Server is the lightweight C# JSON-RPC server powering the easy-dotnet.nvim Neovim plugin";
      homepage = "https://github.com/GustavEikaas/easy-dotnet-server";
      license = lib.licenses.mit;
      platforms = lib.platforms.linux;
    };
  };
in
{
  home.packages = mkMerge [
    (builtins.attrValues {
      inherit (pkgs)

      tokei # count your code
      jdk
      protobuf
      zig

      # nix
      deadnix # finds and remove unused nix code
      nurl # cli tool to generate Nix fetcher calls from repository URLs

      # python
      uv # project package manager

      # c/c++/asm
      gcc
      cmake
      gdb

      # Web development
      typescript
      pnpm
      nodejs_24
      ;
    })

    # dotnet
    ([
      pkgs.dotnet-sdk_10
      pkgs.netcoredbg
      pkgs.dotnet-ef
      easy-dotnet
    ])
  ];
}
