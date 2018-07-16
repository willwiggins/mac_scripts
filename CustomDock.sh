#!/bin/bash

sleep 10

LoggedInUser=$3
LoggedInUserHome="/Users/$3"
plist=$LoggedInUserHome/Library/Preferences/com.apple.dock.plist

echo "Logged in user is $LoggedInUser"
echo "Logged in user's home $LoggedInUserHome"


DOCKUTIL=/Library/Scripts/SalesLoft/dockutil

$DOCKUTIL --remove all --no-restart $LoggedInUserHome
$DOCKUTIL --add '/Applications/Launchpad.app' --no-restart $LoggedInUserHome
$DOCKUTIL --add '/Applications/Google Chrome.app' --no-restart $LoggedInUserHome
$DOCKUTIL --add '/Applications/Slack.app' --no-restart $LoggedInUserHome
$DOCKUTIL --add '/Applications/Self Service.app' --no-restart $LoggedInUserHome
$DOCKUTIL --add '~/Downloads' --view grid --display folder --allhomes
