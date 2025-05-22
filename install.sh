#!/usr/bin/env bash

# install configs
sudo cp *.nix /etc/nixos/
sudo cp -R timers /etc/nixos/

# install nix_build
mkdir /home/blair/bin
cp bin/* /home/blair/bin

