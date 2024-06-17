# default.nix
let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-22.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
  vasm = pkgs.callPackage ./vasm.nix { };
in
{
  inherit vasm;
  shell = pkgs.mkShellNoCC {
    name = "vasm_z80_assembler";
    buildInputs = [
      pkgs.cowsay
      pkgs.lolcat
      vasm
    ];

    shellHook = ''
      echo "Z80 Shell" | cowsay | lolcat
    '';
  };
}
