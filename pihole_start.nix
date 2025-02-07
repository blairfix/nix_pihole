{ config, pkgs, ... }:
{

    # start pihole_start
    #----------------------------------------

    systemd.timers."pihole_start" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnBootSec = "20";
	    Persistent = "true";
	    Unit = "pihole_start.service";
	};
    };

    systemd.services."pihole_start" = {
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
