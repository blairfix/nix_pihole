{ config, pkgs, ... }:
{

    # start update
    #----------------------------------------

    systemd.timers."update" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-01 02:00:00";
	    Persistent = "true";
	    Unit = "update.service";
	};
    };

    systemd.services."update" = {
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
	    bash /home/blair/bin/update.sh
	    '';
    };
}
