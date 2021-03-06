# USED BY infopipe (sunlight tooling) TO GENERATE `devvpn_mi/default.nix`,
# ONLY EDIT THE `expression.st` TEMPLATE in the project git
# repository.
{ stdenv, sunlight, glibcLocales }:

stdenv.mkDerivation rec {
  name = "devvpn_mi";
  version = "0.0.0+build.18.g38e282c";

  src = sunlight.fetch {name = "devvpn_mi";version = "0.0.0+build.18.g38e282c"; sha256 = "1s14z0rr0b4y37z06j3kkdza6my6wnq1n92q4sk771rqv3qr1viy";};

  LOCALE_ARCHIVE = "${glibcLocales}/lib/locale/locale-archive";

  LANG="en_US.UTF-8";
  LC_CTYPE=LANG;
  LC_NUMERIC=LANG;
  LC_TIME=LANG;
  LC_COLLATE=LANG;
  LC_MONETARY=LANG;
  LC_MESSAGES=LANG;
  LC_PAPER=LANG;
  LC_NAME=LANG;
  LC_ADDRESS=LANG;
  LC_TELEPHONE=LANG;
  LC_MEASUREMENT=LANG;
  LC_IDENTIFICATION=LANG;
  LC_ALL=LANG;

  phases = [ "unpackPhase" "installPhase" ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/sunlight/configurations/devvpn_mi
    mkdir -p $out/sunlight/packer/devvpn_mi

    cp src/nix/* $out//sunlight/configurations/devvpn_mi/
    cp src/packer/* $out//sunlight/packer/devvpn_mi/

    runHook postInstall
  '';

  meta = {
    description = "Descriptions for the sinlightapi machine image";
    license = stdenv.lib.licenses.unfree;
  };
}