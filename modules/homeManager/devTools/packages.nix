{ pkgs, lib, ... }:
let
  inherit (lib) mkMerge;
in
{
  home.packages = mkMerge [
    (builtins.attrValues {
      inherit (pkgs)

      tokei # count your code
      jdk
      protobuf

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
    ([pkgs.dotnetCorePackages.dotnet_9.sdk])
  ];
}
