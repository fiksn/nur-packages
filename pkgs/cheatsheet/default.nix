{ stdenv, fetchurl, unzip }:

stdenv.mkDerivation rec {
  name = "cheatsheet-${version}";
  version = "1.3.3.1";

  src = fetchurl {
    url = "https://mediaatelier.com/CheatSheet/CheatSheet_${version}.zip";
    sha256 = "06b7g543qynh36cwqvxnk49rwykw5fc0lalz6p9m2rrr74mv2qi4";
  };

  buildInputs = [ unzip ];

  setSourceRoot = ''
    sourceRoot=CheatSheet.app
  '';

  unpackPhase = ''
    unzip -qq ${src}
  '';

  installPhase = ''
    install -m755 -d "$out/Applications/"
    cp -R . "$_"
  '';

  meta = with stdenv.lib; {
    description = "Know your short cuts";
    homepage = https://mediaatelier.com/CheatSheet/;
    platforms = platforms.darwin;
  };
}
