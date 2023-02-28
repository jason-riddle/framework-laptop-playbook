{ pkgs, ... }:

{
  # https://devenv.sh/languages/
  languages.python = {
    enable = true;
    venv.enable = true;
  };

  # https://devenv.sh/packages/
  # packages = [
  #   pkgs.docker
  #   pkgs.podman
  # ];

  # https://devenv.sh/basics/
  # Force the stdout and stderr streams to be unbuffered. Useful for Molecule.
  # REF: https://docs.python.org/3/using/cmdline.html#envvar-PYTHONUNBUFFERED
  env.PYTHONUNBUFFERED = "1";

  enterShell = ''
    pip install -r requirements-py/requirements-py-dev.txt
  '';

  # https://devenv.sh/pre-commit-hooks/
  pre-commit.hooks.shellcheck.enable = false;
}
