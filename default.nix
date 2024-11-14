let
  pkgs = import <nixpkgs> { };
in
{
  energypylinear = pkgs.python3Packages.callPackage ./energypylinear.nix { };
}