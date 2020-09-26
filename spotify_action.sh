#!/bin/bash

# 1 play
# 2 pause

if [ -f "/tmp/spotify_tmp" ]; then
    #Exist
    value=$(cat /tmp/spotify_tmp)

    if [[ $value == '1' ]]; then
	# Pause music
	$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause)
	$(echo "2" > /tmp/spotify_tmp)
    else
	# Play music
	$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Play)
	$(echo "1" > /tmp/spotify_tmp)
    fi

else
    #Does not exist
    $(touch /tmp/spotify_tmp)
   $(echo "1" > /tmp/spotify_tmp)
fi

