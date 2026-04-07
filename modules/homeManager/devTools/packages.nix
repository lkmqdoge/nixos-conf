{ pkgs, lib, ... }:
let
  inherit (lib) mkMerge;

  buildDotnetGlobalTool = pkgs.dotnetCorePackages.buildDotnetGlobalTool;
  easy-dotnet = buildDotnetGlobalTool {
    pname = "EasyDotnet";
    executables = [ "dotnet-easydotnet" ]; 
    version = "2.3.30";
    nugetHash = "sha256-nlc7vKdf91EZGFtn7AIzefsTpLNMXRHPIr0JITPtKkE=";

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
      black # formatter
      uv # project package manager

      # c/c++/asm
      gcc
      nasm 
      fasm 
      cmake
      gdb

      # golang
      go
      protoc-gen-go
      gotools
      delve # go debugger

      # Web development
      typescript
      nodejs_24
      ;
    })

    # dotnet
    ([
      pkgs.dotnetCorePackages.dotnet_9.sdk
      pkgs.netcoredbg
      pkgs.dotnet-ef
      easy-dotnet
    ])
  ];
}
