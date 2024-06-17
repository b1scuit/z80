{
  stdenv,
  fetchzip,
  gcc
}:

stdenv.mkDerivation {
  pname = "vasm";
  version = "1.9.6";

  src = fetchzip {
    url = "http://phoenix.owl.de/tags/vasm1_9f.tar.gz";
    sha256 = "O2Bly06ifFTlXr/AkrTchbt8FeEUKmyGjA/RqRrcK48=";
  };

  makeFlags = [ "CPU=z80" "SYNTAX=oldstyle" ];

  buildInputs = [ gcc ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp vasmz80_oldstyle $out/bin/vasm
    runHook postInstall
  '';
}
