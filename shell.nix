
with import <nixpkgs> { };
let
  src = fetchFromGitHub {
    owner = "nix-community";
    repo = "poetry2nix";
    rev = "98df940936e09164fdf30f3348fc071403667074";
    sha256 = "163d72djp5z6459v964ij2qam4p2zw6xfjfh3b94qz8xyi2c3w15";
  };
in
with import "${src.out}/overlay.nix" pkgs pkgs;
let
  pythonEnv = poetry2nix.mkPoetryEnv {
    projectDir = ./.;
    python = python3Full;
    pyproject = ./pyproject.toml;
    poetrylock = ./poetry.lock;
  };
in
mkShell {
  name = "actr-notebook";

  nativeBuildInputs = [
    pythonEnv
  ];

}
