#!/usr/bin/env sh

printf ">>> User rebuild: IN PROGRESS\n";
cd ~/.dotfiles;
home-manager switch --flake .#user;
printf ">>> User rebuild: DONE\n";
