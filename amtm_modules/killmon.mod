#!/bin/sh
#bof
killmon_installed(){
	scriptname=killmon
	localVother="$(grep ^Version "$scriptloc" | awk '{print $1}' | sed -e 's/Version=//;s/"//g')"
	if [ "$su" = 1 ]; then
		remoteurl=https://raw.githubusercontent.com/ViktorJp/KILLMON/main/killmon.sh
		remoteVother="$(c_url "$remoteurl" | grep ^Version | awk '{print $1}' | sed -e 's/Version=//;s/"//g')"
		grepcheck=ViktorJp
	fi
	script_check
	if [ -z "$su" -a -z "$tpu" ] && [ "$killmonUpate" ]; then
		localver="$lvtpu"
		upd="${E_BG}$killmonUpate${NC}"
		if [ "$killmonMD5" != "$(md5sum "$scriptloc" | awk '{print $1}')" ]; then
			[ -f "${add}"/availUpd.txt ] && sed -i '/^killmon.*/d' "${add}"/availUpd.txt
			upd="${E_BG}${NC}$lvtpu"
			unset localver killmonUpate killmonMD5
		fi
	fi
	[ -z "$updcheck" -a -z "$ss" ] && printf "${GN_BG} km${NC} %-9s%-21s%${COR}s\\n" "open" "KILLMON     $localver" " $upd"
	case_km(){
		trap trap_ctrl 2
		trap_ctrl(){
			sleep 2
			echo "${NC}"
			exec "$0"
		}
		/jffs/scripts/killmon.sh -setup
		trap - 2
		sleep 2
		show_amtm menu
	}
}
install_killmon(){
	p_e_l
	printf " This installs KILLMON - IPv4/IPv6 VPN Kill\\n Switch Monitor & Configurator on your router.\\n\\n"
	printf " Author: Viktor Jaep\\n snbforums.com/threads/killmon-v1-01-dec-9-2022-ip4-ip6-vpn-kill-switch-monitor-configurator.81758/\\n"
	c_d
	c_url https://raw.githubusercontent.com/ViktorJp/KILLMON/main/killmon.sh -o /jffs/scripts/killmon.sh && chmod a+rx /jffs/scripts/killmon.sh && /jffs/scripts/killmon.sh -setup
	sleep 2
	if [ -f /jffs/scripts/killmon.sh ]; then
		show_amtm " KILLMON installed"
	else
		am=;show_amtm " KILLMON installation failed"
	fi
}
#eof
