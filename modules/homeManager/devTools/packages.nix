{ pkgs, ... }:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
    # count your code
    tokei 

    # toolchains
    gcc
    jdk
    go
    nasm 
    fasm 
    protoc-gen-go 
    protobuf
    typescript
    nodejs_24

    cmake
    gdb
    ;
    dotnet = pkgs.dotnetCorePackages.dotnet_9.sdk;
  };
}
