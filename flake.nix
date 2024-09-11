{
  inputs = {
    utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, utils }: utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      pythonEnv = with pkgs.python312Packages; [
        pulp
        venvShellHook
      ] ++ [pkgs.python312];
    in
    {
      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [
          pythonEnv
        ];
        venvDir = "./.venv/";
        postVenvCreation = ''
          pip install -e ./energypylinear
        '';
      };
    }
  );
}

