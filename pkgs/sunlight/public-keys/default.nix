{ bash
, gawk
, gnugrep
, gnupg
, makeWrapper
, stdenv
, sunlight # needed for 'src'
}:

stdenv.mkDerivation rec {
  name = "public-keys";
  version = "0.0.12+build.12.gb970471";
  src = sunlight.fetch {name = "public-keys";version = "0.0.12+build.12.gb970471"; sha256 = "0qb5gnnghy0d3ngc40d5caxfmfskrnhxd3yklfcy0hrpld4wrh64";};

  buildInputs = [ makeWrapper ];

  phases = [ "unpackPhase" "installPhase" "postInstall" ];

  installPhase = ''
    mkdir -p $out/sunlight/etc/public-keys
    cp keys/*.asc $out/sunlight/etc/public-keys/

    mkdir -p $out/bin
    cp bin/* $out/bin/
  '';

  postInstall = ''
    substituteInPlace $out/bin/import-sunlight-keys \
        --replace "/bin/bash" "${bash}/bin/bash"
    wrapProgram $out/bin/import-sunlight-keys \
        --suffix PATH : ${gawk}/bin \
        --suffix PATH : ${gnugrep}/bin \
        --suffix PATH : ${gnupg}/bin
  '';

  meta = {
    description = "Approved developer public keys";
    license = stdenv.lib.licenses.unfree;
  };
}