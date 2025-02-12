{ config, pkgs, ... }:
{

services.caddy = {
    enable = true;
    extraConfig =
	''

	http://fix-pihole.com {
	    reverse_proxy 127.0.0.1/admin
	}

	'';
};

}

