# Nix Hello World

This is just a simple program to experience on Nix derivation/packages.

## Build or Install in Nix Environment

### Build

To build this program by Nix, clone or download this project and run the following command at the root directory of the project:

```bash
nix-build
```

or the long version by specifying the file: `nix-build default.nix`, or even doing instantiate and realise step-by-step: `nix-store -r $(nix-instantiate default.nix)`.

### Install

To install this program in Nix Environment, run the following command at the root directory of the project:

```bash
nix-env -i -f default.nix
```

or the long version: `nix-env --install --file default.nix`.

### Inspect

You can get the out path by running `nix-store -q --outputs $(nix-instantiate default.nix)` or `nix eval '("${import ./default.nix}")'` before installation, or `nix-env -q --out-path --no-name hello` after installing.

To see the contents of the .drv file, run: `nix show-derivation $(nix-instantiate default.nix)` or `nix show-derivation $(nix-store -q --deriver $(nix eval '("${import ./default.nix}")' | cut -d '"' -f 1))`.

## Build Manually

You can build it manually with `gcc` by running:

```bash
gcc src/hello.c -o hello
```

## References

- [Nix Pills](https://nixos.org/nixos/nix-pills/)
