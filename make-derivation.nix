pkgs: attrs:
  with pkgs;
  let defaultAttrs = {
    builder = "${bash}/bin/bash";
    args = [ ./generic-builder.sh ];
    system = builtins.currentSystem;

    configurePhase = "echo 'No configure script, doing nothing'";
    buildPhase = "echo 'Error: No build script, please set the buildPhase attribute'; exit 1";
    installPhase = "echo 'Error: No install script, please set the installPhase attribute'; exit 1";

    standardBuildInputs = [
      (if builtins.match ".*darwin" builtins.currentSystem != null then binutils-unwrapped else null)
    ];
  };
  in derivation (defaultAttrs // attrs)
