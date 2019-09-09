{ stdenv, lib, go, buildGoPackage, fetchFromGitHub, bash }:

buildGoPackage rec {
  name = "kaniko";
  version = "v0.11.0";
  goPackagePath = "github.com/GoogleContainerTools/kaniko";

  goDeps = ./deps.nix;

  src = fetchFromGitHub {
    owner = "GoogleContainerTools";
    repo = "kaniko";
    rev = "${version}";
    sha256 = "0x2xda7hlvssfysarfxii42nv74s8xp2k7smngcqb26fg40dach0";
  };

  buildPhase = ''
    cd go/src/${goPackagePath}
    substituteInPlace ./Makefile --replace /bin/bash ${bash}/bin/bash
    make
  '';

  installPhase = ''
    mkdir -pv $bin/bin
    cp -v out/executor $bin/bin/kaniko
  '';

  meta = with stdenv.lib; {
    homepage = "https://github.com/GoogleContainerTools/kaniko";
    description = "Build Images In Kubernetes";
    license = licenses.asl20;
    platforms = platforms.linux;
  };
}
