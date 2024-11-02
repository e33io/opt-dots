#!/bin/bash

# ============================================================================
# JWM bar script (Tray section, Swallow tag)
# ----------------------------------------------------------------------------
# NOTE: When changing `printf` functions in the script output (add or remove),
#       update the Swallow `width` in the Tray section of the .jwmrc file
#       to correct the display output size/spacing
# ============================================================================

# Local date (output current day/date)
date1() {
	date +"%b %d"
}

# Local time (output current time)
time1() {
	date +"%H:%M:%S"
}

# Volume function (output volume icon with volume level or MUTE indicator)
vol() {
	if [ -f /bin/pactl ]; then
		vol="$(pactl get-sink-volume @DEFAULT_SINK@ | awk '/Volume:/ { print $5 }')"
		mute="$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{ print $2 }')"
		if [ $mute = yes ]; then
			echo " MUTE"
		else
			echo " $vol%"
		fi
	else
		echo " ---"
	fi
}

# Battery function (output charging icon with battery level)
bat() {
	if [ -d /sys/class/power_supply/BAT0 ]; then
		batstat="$(cat /sys/class/power_supply/BAT0/status)"
		batcap="$(cat /sys/class/power_supply/BAT0/capacity)"
		if [ $batstat = Charging ]; then
			echo " $batcap%%"
		else
			echo " $batcap%%"
		fi
	else
		echo " ----"
	fi
}

# Network function (output static icon to indicate connection type)
net() {
	wifi="$(ip a | grep 'wlan\|wlp' | grep 'state UP' | wc -l)"
	wire="$(ip a | grep 'eth0\|enp' | grep 'state UP' | wc -l)"
	if [ $wifi = 1 ]; then
		echo " "
	elif [ $wire = 1 ]; then 
		echo " "
	else 
		echo " "
	fi
}

# Spacer function (define blank space in output)
spcr() {
	echo "  "
}

# Script output (add or remove `printf` functions as needed)
tput civis
while :; do
	printf "\n$(spcr)$(date1)$(spcr)$(time1)$(spcr)$(vol)$(spcr)$(net)"
	sleep 1
done
