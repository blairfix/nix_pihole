{ config, pkgs, ... }:
{
    imports =
	[ 
	    ./hardware-configuration.nix

	    # configs
	    ./packages.nix
	    ./nvim.nix

	];

    # bootloader
    boot.loader.systemd-boot.enable = true;

    # kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # hostname
    networking.hostName = "pihole"; 

    # networking
    networking.networkmanager.enable = true;

    # time zone
    time.timeZone = "America/Edmonton";

    # utf8 setting
    i18n.defaultLocale = "en_CA.UTF-8";

    # tailscale
    services.tailscale.enable = true;

    # ssh
    services.openssh.enable = true;
    
    # docker
    virtualisation.docker.enable = true;



    # user account. Add password with ‘passwd’.
    users.users.blair = {
	isNormalUser = true;
	description = "blair";
	extraGroups = [ 
	    "networkmanager" 
	    "wheel" 
	    "docker"
	];
    };

    # unfree packages
    nixpkgs.config.allowUnfree = true;


    # for bash scripts 
    services.envfs.enable = true;

    # version 
    system.stateVersion = "24.05"; 

}
