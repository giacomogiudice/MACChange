#!/bin/sh

plist="/Library/LaunchDaemons/com.changemac.plist";
script="/Library/Scripts/MACChange/chmac.sh";

echo "Copying script to $script";
cp chmac.sh "$script";
echo "Copying plist to $plist";
cp com.changemac.plist "$plist";
echo "loading plist to launchd";
chown root "$plist";
launchctl load "$plist";
