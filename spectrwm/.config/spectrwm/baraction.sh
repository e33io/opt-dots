#!/usr/bin/env bash

#### spectrwm baraction script ########################################

print_date() {
    FORMAT="%a %b %d  %H:%M:%S"
    DATE=`date "+${FORMAT}"`
    echo -n "${DATE}  "
}

print_battery() {
    batcap="$(cat /sys/class/power_supply/BAT0/capacity)"
    batstat="$(cat /sys/class/power_supply/BAT0/status)"
    if [ $batstat = Charging ]; then
        echo -n " $batcap%  "
    else
        echo -n " $batcap%  "
    fi
}

print_volume() {
    vol="$(pactl get-sink-volume @DEFAULT_SINK@ | awk '/Volume:/ { print $5 }')"
    mute="$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{ print $2 }')"
    if [ $mute = yes ]; then
        echo -n " MUTED  "
    else
        echo -n " $vol  "
    fi
}

print_network() {
    wifi="$(ip a | grep 'wlan\|wlp' | grep 'state UP' | wc -l)"
    wire="$(ip a | grep 'eth0\|enp' | grep 'state UP' | wc -l)"
    if [ $wifi = 1 ]; then
        echo -n "  "
    elif [ $wire = 1 ]; then 
        echo -n "  "
    else 
        echo -n "  "
    fi
}

print_synology-drive() {
    drive="$(lsof -i | grep 'cloud-dri' | grep 'ESTABLISHED' | awk '{ print $1 }' | head -n 1)"
    if [ $drive = cloud-dri ]; then
        echo -n "  "
    else
        echo -n "  "
    fi
}

while :; do
    print_date
    #print_battery
    print_volume
    print_network
    #print_synology-drive
    echo ""
    sleep 1
done
