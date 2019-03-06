let
  pkgs = import <nixpkgs> {};
  mkDerivation = import ./make-derivation.nix pkgs;
in with pkgs; mkDerivation {
  name = "hello";

  src = ./src;
  buildInputs = [ coreutils gcc ];

  configurePhase = ''
    declare -xp
  '';
  buildPhase = ''
    gcc "$src/hello.c" -o ./hello
  '';
  installPhase = ''
    mkdir -p "$out/bin"
    cp ./hello "$out/bin/"
  '';
}
