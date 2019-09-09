{ pkgs ? import <nixpkgs> {} }:

{
 # TODO
}
// (if pkgs.stdenv.isLinux then {
  kaniko = pkgs.callPackage ./kaniko {};
} else {})
// (if pkgs.stdenv.isDarwin then {
  cheatsheet = pkgs.callPackage ./cheatsheet {};
} else {})

