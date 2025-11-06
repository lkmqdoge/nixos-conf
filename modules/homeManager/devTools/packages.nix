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
      ;
    })

    # python
    (builtins.attrValues {
      inherit (pkgs)
      black # formatter
      uv # project package manager
      ;
    })

    # c/c++/asm
    (builtins.attrValues {
      inherit (pkgs)
      gcc
      nasm 
      fasm 
      cmake
      gdb
      ;
    })

    # golang
    (builtins.attrValues {
      inherit (pkgs)
      go
      protoc-gen-go
      gotools
      delve # go debugger
      ;
    })

    # dotnet
    ([pkgs.dotnetCorePackages.dotnet_9.sdk])

    # Web development
    (builtins.attrValues {
      inherit (pkgs)
      typescript
      nodejs_24
      ;
    })
  ];
}
