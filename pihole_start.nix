{ config, pkgs, ... }:
{

    # start pihole
    #----------------------------------------

    systemd.timers."pihole" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnBootSec = "20";
	    Persistent = "true";
	    Unit = "pihole.service";
	};
    };

    systemd.services."pihole" = {
	serviceConfig = {
	    Type = "simple";
	    User = "root";
	};

	path = with pkgs; [ 
	    bash
	    docker
	    docker-compose
	];
	script = ''
	    bash cd /home/blair/pihole && docker-compose pull && docker-compose up -d
	    '';
    };
}
