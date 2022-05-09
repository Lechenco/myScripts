#!/bin/bash
POLYBAR_LAUNCH=~/.config/polybar/launch.sh

help() {
	echo "$0 [option]"
	echo
	echo " -o | --off"
	echo " -m | --mirror"
	echo " -r | --right"
	echo " -l | --left"
	echo " -s | --sound {on | off}"	
	echo
}

hdmi_off() {
	xrandr --output HDMI1 --off
}

hdmi_mirror(){
	xrandr --output HDMI1 --same-as eDP1 --auto
}

hdmi_extend_right(){
	xrandr --output HDMI1 --right-of eDP1 --auto
}

hdmi_extend_left(){
	xrandr --output HDMI1 --left-of eDP1 --auto
}

hdmi_audio_on(){
	pacmd set-card-profile 0 output:hdmi-stereo
}

hdmi_audio_off(){
	pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo
}

if [ "$1" == "" ]; then help; fi

display_mode=
sound_hdmi=
## Get parameters
while [ "$1" != "" ]; do
	case "$1" in 
		-o | --off )		display_mode=0
					;;
		-m | --mirror )		display_mode=1
					;;
		-l | --left )		display_mode=2
					;;
		-r | --right ) 		display_mode=3
					;;
		-s | --sound ) 		shift
					sound_hdmi=$1
					;;
		* )			help
					exit 1
	esac
	shift
done

## Changing display Configuration
if [ "$display_mode" != "" ]; then
case "$display_mode" in 
		0 )		hdmi_off
					;;
		1 )		hdmi_mirror
					;;
		2 )		hdmi_extend_left
					;;
		3 ) 		hdmi_extend_right
esac
#	i3-msg restart
source $POLYBAR_LAUNCH & disown $POLYBAR_LAUNCH
fi

## Set Sound Configuration
if [ "$sound_hdmi" != "" ]; then
case "$sound_hdmi" in
	0 | off ) 	hdmi_audio_off
			;;
	1 | on ) 	hdmi_audio_on
			;;
	* )		help
			exit 1
esac
fi



