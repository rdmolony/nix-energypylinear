# `nix-energypylinear`

This repository defines a `Nix` definition for building the `Python` library `energypylinear` 

> [!WARNING]
> This build failed on 24-11-14 because ...
> 
> The `<nixpkgs>` versions of `rich` & `seaborn` are too new for this `PyPi` definition ...
> ```sh
> rich<13.0.0,>=12.0.0 not satisfied by version 13.7.1
> seaborn<0.13.0,>=0.12.2 not satisfied by version 0.13.2
> ``` 
>
> The `nix flake` version of `pandera` is too new for this `PyPi` definition ...
> ```sh
> pandera<0.15.0,>=0.14.5 not satisfied by version 0.20.4
> ``` 

---

## Install `nix`

Install `nix` ...

Via [DeterminateSystems/nix-installer](https://github.com/DeterminateSystems/nix-installer) ...

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

Or via [the official installer](https://nix.dev/install-nix.html) ...

```sh
curl -L https://nixos.org/nix/install | sh -s -- --daemon
```

> [!NOTE]
> [`DeterminateSystems/nix-installer` ships with a `nix-uninstall` command if you want to easily remove it](https://github.com/DeterminateSystems/nix-installer/blob/ef23eb4d30c279547bdbe3026a0acaaf8bc680dc/README.md#uninstalling) 

---

## `Nix Flake`

Add ...

```nix
{
  inputs = {
    energypylinear = {
      url = "github:rdmolony/energypylinear";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
```

... to your `flake.nix` to install this `nix` derivation in your project. 

---

## Build Locally

Via `nix develop` ...

```sh
nix build
```

Or interactively via `nix repl` ...

```sh
nix repl --show-trace
:lf .
:l <nixpkgs>
pandera = inputs.pandera.packages.${pkgs.system}.default
energypylinear = pkgs.python3Packages.callPackage ./energypylinear.nix { pandera = pandera; }
:b energypylinear
```

> [!NOTE]
> `nix build` is able to install upstream dependency `pandera` via the `nix flake` `github:rdmolony/pandera` whereas **the legacy command `nix-build` depends on `default.nix` which depends on `<nixpkgs>` (via `pkgs.python3Packages.callPackage`) which is missing upstream dependency `pandera`**
