{ config, pkgs, ... }:
{

    # start pihole_start
    #----------------------------------------

    systemd.timers."pihole_start" = {
	wantedBy = [ "timers.target" ];
	after = ["docker.service" "docker.socket"];
	timerConfig = {
	    OnBootSec = "60";
	    Persistent = "true";
	    Unit = "pihole_start.service";
	};
    };

    systemd.services."pihole_start" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	};

	path = with pkgs; [ 
	    bash
	    docker
	    docker-compose
	];
	script = ''
	    bash /home/blair/cloud_work/github/nix_pihole/pihole_start.sh
	    '';
    };
}
