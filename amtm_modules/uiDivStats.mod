#!/bin/sh
#bof
uiDivStats_installed(){
	scriptname=uiDivStats
	scriptgrep=' SCRIPT_VERSION='
	if [ "$su" = 1 ]; then
		remoteurl="https://raw.githubusercontent.com/jackyaz/uiDivStats/master/uiDivStats.sh"
		grepcheck=jackyaz
	fi
	script_check
	printf "${GN_BG} j5${NC} %-9s%-21s%${COR}s\\n" "open" "uiDivStats    $localver" " $upd"
	case_j5(){
		/jffs/scripts/uiDivStats
		sleep 2
		show_amtm menu
	}
}
install_uiDivStats(){
	p_e_l
	echo " This installs uiDivStats - WebUI for Diversion statistics"
	echo " on your router."
	echo
	echo " Author: Jack Yaz"
	echo " https://www.snbforums.com/threads/uidivstats-webui-for-diversion-statistics.56393/"
	c_d

	if [ -f /opt/bin/diversion ]; then
		c_url "https://raw.githubusercontent.com/jackyaz/uiDivStats/master/uiDivStats.sh" -o "/jffs/scripts/uiDivStats" && chmod 0755 /jffs/scripts/uiDivStats && /jffs/scripts/uiDivStats install
		sleep 2
	else
		am=;show_amtm " uiDivStats installation failed,\\n Diversion is not installed"
	fi
	if [ -f /jffs/scripts/uiDivStats ] && grep -q 'uiDivStats startup' /jffs/scripts/services-start 2> /dev/null; then
		show_amtm " uiDivStats installed"
	else
		am=;show_amtm " uiDivStats installation failed"
	fi
}
#eof