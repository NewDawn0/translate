{ pkgs }:
pkgs.stdenv.mkDerivation {
  name = "translate-c-example";
  pname = "translate";
  src = ./.;
  buildPhase = ''
    export CPATH="${pkgs.translate}/include";
    export LIBRARY_PATH="${pkgs.translate}/lib";
    cc -ltranslate -otranslate translate.c
  '';
  installPhase = "install -D translate $out/bin/translate";
}
