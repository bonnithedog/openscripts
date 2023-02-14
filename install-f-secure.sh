

#!/bin/bash
#set -x

# Installs F-secure Withsecure needs a valid subscription.

filehttp="https://download.sp.f-secure.com/PSB/latest/installer/F-Secure_PSB1_Mac_Installer%SUBSCRIPTIONID%5D.mpkg"
worktmpdir="/tmp/"
installerps="F-Secure_PSB1_Mac_Installer[SUBSCRIPTIONID].mpkg"


curl -o $worktmpdir$installerps $filehttp
