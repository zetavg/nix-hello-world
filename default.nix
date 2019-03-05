with import <nixpkgs> {}; derivation {
  name = "hello";
  system = builtins.currentSystem;
  builder = "${bash}/bin/bash";
  args = [ ./build.sh ];
  src = ./src;
  inherit gcc coreutils;
  binutils = if builtins.match ".*darwin" builtins.currentSystem != null then binutils-unwrapped else null;
}
