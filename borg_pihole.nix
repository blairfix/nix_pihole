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
	    User = "pihole";
	};
	path = with pkgs; [ 
	    bash
	    borgbackup
	];
	script = ''
	    bash /home/blair/bin/backup.sh
	    '';
    };

}

