{ config, pkgs, ... }:
{

    # start ladder_start
    #----------------------------------------

    systemd.timers."ladder_start" = {
	wantedBy = [ "timers.target" ];
	after = ["docker.service" "docker.socket"];
	timerConfig = {
	    OnBootSec = "80";
	    Persistent = "true";
	    Unit = "ladder_start.service";
	};
    };

    systemd.services."ladder_start" = {
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
	    bash /home/blair/nix_pihole/ladder_start.sh
	    '';
    };
}
