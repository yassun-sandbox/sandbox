#! /bin/bash

. ./path.conf

if
osascript -e '
    tell application "System Events"
        activate
        display dialog "退社しますか？"
    end tell
' &>/dev/null
then :
  cd ${DIR}
  ${BUNDLE} bin/shukkin end
fi

