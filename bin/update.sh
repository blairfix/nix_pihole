#!/usr/bin/bash

# update
nixos-rebuild --upgrade switch

# clean old builds
nix-collect-garbage --delete-older-than 60d

# reboot
reboot
