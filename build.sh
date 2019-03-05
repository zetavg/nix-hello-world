declare -xp # Print details of the shell variables, just for inspection

# The $coreutils and $gcc variable came from "inherit gcc coreutils;" in ./default.nix
export PATH="$coreutils/bin:$gcc/bin:$binutils/bin"

# Nix exports the decided out path, but we'll need to create it by ourself
mkdir "$out"
mkdir "$out/bin"

# The $src variable came from "src = ./src;" in ./default.nix
gcc "$src/hello.c" -o "$out/bin/hello"
