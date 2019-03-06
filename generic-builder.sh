set -e
unset PATH

for p in $standardBuildInputs; do
  export PATH=$p/bin${PATH:+:}$PATH
done

for p in $buildInputs; do
  export PATH=$p/bin${PATH:+:}$PATH
done

echo "Configuring"
eval "${configurePhase}"

echo "Building"
eval "${buildPhase}"

echo "Installing"
eval "${installPhase}"

echo "Post-installation Fixup"
eval "${fixupPhase}"
