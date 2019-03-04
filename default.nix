with import <nixpkgs> {}; derivation {
  name = "hello";
  system = builtins.currentSystem;
  builder = "${bash}/bin/bash";
  args = [ ./build.sh ];
  src = ./src;
  inherit gcc coreutils;
}
