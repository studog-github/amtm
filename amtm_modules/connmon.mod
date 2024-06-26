#!/bin/sh
#bof
connmon_installed(){
	scriptname=connmon
	scriptgrep=' SCRIPT_VERSION='
	if [ "$su" = 1 ]; then
		remoteurl=https://jackyaz.io/connmon/master/amtm-version/connmon.sh
		remoteurlmd5=https://jackyaz.io/connmon/master/amtm-md5/connmon.sh
		grepcheck=jackyaz
	fi
	script_check
	if [ -z "$su" -a -z "$tpu" ] && [ "$connmonUpate" ]; then
		localver="$lvtpu"
		upd="${E_BG}$connmonUpate${NC}"
		if [ "$connmonMD5" != "$(md5sum "$scriptloc" | awk '{print $1}')" ]; then
			[ -f "${add}"/availUpd.txt ] && sed -i '/^connmon.*/d' "${add}"/availUpd.txt
			upd="${E_BG}${NC}$lvtpu"
			unset localver connmonUpate connmonMD5
		fi
	fi
	[ -z "$updcheck" -a -z "$ss" ] && printf "${GN_BG} j1${NC} %-9s%-21s%${COR}s\\n" "open" "connmon       $localver" " $upd"
	case_j1(){
		/jffs/scripts/connmon
		sleep 2
		show_amtm menu
	}
}
install_connmon(){
	p_e_l
	printf " This installs connmon - Internet connection\\n monitoring on your router.\\n\\n"
	printf " Author: Jack Yaz\\n snbforums.com/forums/asuswrt-merlin-addons.60/?prefix_id=18&starter_id=53009\\n"
	c_d
	c_url https://jackyaz.io/connmon/master/amtm-install/connmon.sh -o /jffs/scripts/connmon && chmod 0755 /jffs/scripts/connmon && /jffs/scripts/connmon install
	sleep 2
	if [ -f /jffs/scripts/connmon ]; then
		show_amtm " connmon installed"
	else
		am=;show_amtm " connmon installation failed"
	fi
}
#eof
