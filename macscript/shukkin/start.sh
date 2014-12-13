#! /bin/bash

SH_PATH=$(cd $(dirname $0);pwd)
. ${SH_PATH}/path.conf

if
osascript -e '
    tell application "System Events"
        activate
        display dialog "出社しますか？"
    end tell
' &>/dev/null
then :
  cd ${DIR}
  ${BUNDLE} bin/shukkin start
fi

