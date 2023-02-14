#!/bin/bash
#set -x

# Downloads and install a specific driver. In this example for Canon

curl -o /tmp/mac-ps-v41710-06.dmg https://gdlp01.c-wss.com/gds/9/0100010979/08/mac-ps-v41710-06.dmg

hdiutil attach /tmp/mac-ps-v41710-06.dmg

installer -pkg /Volumes/mac-ps-v41710-06/Canon_PS_Installer.pkg -target /

hdiutil detach "/Volumes/mac-ps-v41710-06"

rm /tmp/mac-ps-v41710-06.dmg
