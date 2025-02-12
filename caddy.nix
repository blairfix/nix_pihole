{ config, pkgs, ... }:
{

services.caddy = {
    enable = true;
    extraConfig =
	''

	server.port := 1080

	http://fix-pihole.com {
	    reverse_proxy 127.0.0.1/admin
	}

	'';
};

}

