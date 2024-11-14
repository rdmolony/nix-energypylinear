{ lib
, buildPythonPackage
, fetchPypi
, setuptools
, pulp
, numpy
, pydantic
, pandas
, matplotlib
, seaborn
, pandera
, markdown-include
}:

buildPythonPackage rec {
  pname = "offtheboil";
  version = "1.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    numpy
    pydantic
    pandas
    matplotlib
    seaborn
    pandera
    markdown-include
  ];

  meta = {
    homepage = "https://github.com/rdmolony/nix-energypylinear/";
    description = "Optimizing energy assets with mixed-integer linear programming.";
  };
}