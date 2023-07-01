#!/usr/bin/env bash

socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read line
do
	pline=(${line/>>/ })
	set=${pline[0]}
	to=${pline[1]}

	[ "$set" = "workspace" ] && echo $to
done
