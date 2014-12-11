if
osascript -e '
    tell application "System Events"
        activate
        display dialog "メッセージ"
    end tell
' &>/dev/null
then :
  echo 'OK!!!'
fi

