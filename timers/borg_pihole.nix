{ config, pkgs, ... }:
{

    # borg pihole
    #----------------------------------------

    systemd.timers."borg_pihole" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-*  *:19:00";
	    Persistent = "true";
	    Unit = "borg_pihole.service";
	};
    };

    systemd.services."borg_pihole" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    WorkingDirectory = "/home/blair/backup";

	};
	path = with pkgs; [ 
	    bash
	    borgbackup
	];
	script = ''
	    bash /home/blair/backup/backup.sh
	    '';
    };

}

