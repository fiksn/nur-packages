{ pkgs ? import <nixpkgs> {} }:

{
  #modules = import ./modules;
  #overlays = import ./overlays;

  pkgs = import ./pkgs { inherit pkgs; };
}
