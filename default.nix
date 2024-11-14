let
  pkgs = import <nixpkgs> { };
in
{
  energypylinear = pkgs.python312Packages.callPackage ./energypylinear.nix { };
}