{
  stdenv,
  fetchzip,
  gcc
}:

stdenv.mkDerivation {
  pname = "vasm";
  version = "1.7.0";

  src = fetchzip {
    url = "http://phoenix.owl.de/tags/vasm1_7.tar.gz";
    sha256 = "VRJiwElFunMzzBuZKQtCK2kv+EX97vbcudHRyP4zS24=";
  };

  makeFlags = [ "CPU=z80" "SYNTAX=std" ];

  buildInputs = [ gcc ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp vasmz80_std $out/bin
    runHook postInstall
  '';
}
