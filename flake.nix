{
  inputs = {
    utils.url = "github:numtide/flake-utils";
    pandera = {
      url = "github:rdmolony/nix-pandera";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, utils, ... }@inputs: utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      pandera = inputs.pandera.packages.${system}.default;
      energypylinear = pkgs.python3Packages.callPackage ./energypylinear.nix {
        pandera = pandera;
      };
    in
    {
      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [
          energypylinear
        ];
      };
      packages = {
        default = energypylinear;
        pandera = pandera;
      };
    }
  );
}
