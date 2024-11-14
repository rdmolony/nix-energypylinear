{ lib
, buildPythonPackage
, fetchPypi
, setuptools
, setuptools-scm
, pulp
, numpy
, pydantic
, pandas
, poetry-core
, matplotlib
, rich
, seaborn
, pandera
, markdown-include
}:

buildPythonPackage rec {
  pname = "energypylinear";
  version = "1.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-uBclnewHsGCR3QO3rShhf+S+txj6aT6djT3VXr1PaEE=";
  };

  build-system = [
    setuptools
    setuptools-scm
    poetry-core
  ];

  dependencies = [
    numpy
    pydantic
    pandas
    pulp
    matplotlib
    seaborn
    pandera
    rich
    markdown-include
  ];

  meta = {
    homepage = "https://github.com/rdmolony/nix-energypylinear/";
    description = "Optimizing energy assets with mixed-integer linear programming.";
  };
}