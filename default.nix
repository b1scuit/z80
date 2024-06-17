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
      export PS1="\n\[\033[1;32m\][Z80-shell:\w]\$\[\033[0m\] "
      alias view="hexdump -C a.out"
      echo "Z80 Shell" | cowsay | lolcat
    '';
  };
}
