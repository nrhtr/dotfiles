[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
#autolock -time 15 locker "~bin/obflock.sh" &
#i3status | lemonbar &
wal -R
exec i3
