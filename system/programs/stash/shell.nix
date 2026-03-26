{ pkgs ? import <nixpkgs> {} }:

let
  packageOverrides = pkgs.callPackage ./python-packages.nix {};
  python = pkgs.python3.override { inherit packageOverrides; };
in
pkgs.mkShell {
  packages = with pkgs; [
    (python.withPackages(p: [ p.stashapi ]))
  ];
  shellHook = ''
    SOURCE_DATE_EPOCH=$(date +%s)
    VENV=.venv

    if test ! -d $VENV; then
      python3.12 -m venv $VENV
    fi
    source ./$VENV/bin/activate
    export PYTHONPATH=`pwd`/$VENV/${python.sitePackages}/:$PYTHONPATH
  '';

  postShellHook = ''
    ln -sf ${python.sitePackages}/* ./.venv/lib/python3.12/site-packages
  '';
}
