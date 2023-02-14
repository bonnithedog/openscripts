#!/bin/bash
#set -x

#### Download and launch your Acrobat Reader software 
## https://ardownload2.adobe.com/pub/adobe/reader/mac/AcrobatDC/2200220191/AcroRdrDC_2200220191_MUI.dmg ##

curl -o /tmp/AcroRdrDC_2200220191_MUI.dmg https://ardownload2.adobe.com/pub/adobe/reader/mac/AcrobatDC/2200220191/AcroRdrDC_2200220191_MUI.dmg

hdiutil attach /tmp/AcroRdrDC_2200220191_MUI.dmg

installer -pkg /Volumes/AcroRdrDC_2200220191_MUI/AcroRdrDC_2200220191_MUI.pkg -target /

hdiutil detach "/Volumes/AcroRdrDC_2200220191_MUI"

rm /tmp/AcroRdrDC_2200220191_MUI.dmg
