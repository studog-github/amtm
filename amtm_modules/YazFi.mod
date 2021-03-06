#!/bin/sh
#bof
YazFi_installed(){
	scriptname=YazFi
	scriptgrep=' YAZFI_VERSION'
	if [ "$su" = 1 ]; then
		remoteurl="https://raw.githubusercontent.com/jackyaz/YazFi/master/YazFi.sh"
		grepcheck=jackyaz
	fi
	script_check
	if [ -z "$su" -a -z "$tpu" ] && [ "$YazFiUpate" ]; then
		localver="$lvtpu"
		upd="${E_BG}$YazFiUpate${NC}"
		if [ "$YazFiMD5" != "$(md5sum "$scriptloc" | awk '{print $1}')" ]; then
			sed -i '/^YazFi.*/d' "${add}"/availUpd.txt
			upd="${E_BG}${NC}$lvtpu"
			unset localver YazFiUpate YazFiMD5
		fi
	fi
	printf "${GN_BG} 4 ${NC} %-9s%-21s%${COR}s\\n" "open" "YazFi         $localver" " $upd"
	case_4(){
		/jffs/scripts/YazFi
		sleep 2
		show_amtm menu
	}
}
install_YazFi(){
	p_e_l
	echo " This installs YazFi - enhanced AsusWRT-Merlin Guest WiFi Networks"
	echo " on your router."
	echo
	echo " Author: Jack Yaz"
	echo " https://www.snbforums.com/forums/asuswrt-merlin-addons.60/"
	c_d
	c_url "https://raw.githubusercontent.com/jackyaz/YazFi/master/YazFi.sh" -o "/jffs/scripts/YazFi" && chmod 0755 /jffs/scripts/YazFi && /jffs/scripts/YazFi install
	sleep 2
	if [ -f /jffs/scripts/YazFi ]; then
		show_amtm " YazFi installed"
	else
		am=;show_amtm " YazFi installation failed"
	fi
}
#eof
