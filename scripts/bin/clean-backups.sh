#/usr/bin/env bash
borg list | awk '/\.failed/{ print $1 }' | xargs -I {} borg delete "::{}"
