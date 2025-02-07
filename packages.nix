{ pkgs, ... }: {
    environment.systemPackages = with pkgs;  [ 

	# terminal 
	alacritty 
	fzf 
	ripgrep
	eza
	fd
	tree
	killall
	unzip
	zip
	ncdu

	# utilities
	git
	htop 
	bottom
	trash-cli 

	# ssh and network
	openssh 
	sshpass
	tailscale

	# syncing utilities
	rsync
	borgbackup

	# containers
	docker-compose

	];
}
