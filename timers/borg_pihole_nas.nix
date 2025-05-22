{ config, pkgs, ... }:
{

    # borg pihole
    #----------------------------------------

    systemd.timers."borg_pihole_nas" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar= "*-*-* 03:40:00";
	    Persistent = "true";
	    Unit = "borg_pihole_nas.service";
	};
    };

    systemd.services."borg_pihole_nas" = {
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
	    bash /home/blair/backup/backup_nas.sh
	    '';
    };

}

