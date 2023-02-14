# Creating a new local admin and enable or disable SSH 

#!/bin/bash

#Creates 'NEWAdmin' user
sudo dscl . -create /Users/NEWAdmin
sudo dscl . -create /Users/NEWAdmin UserShell /bin/bash
sudo dscl . -create /Users/NEWAdmin RealName "NEWAdmin" 
sudo dscl . -create /Users/NEWAdmin UniqueID "401"
sudo dscl . -create /Users/NEWAdmin PrimaryGroupID 20
sudo dscl . -create /Users/NEWAdmin NFSHomeDirectory /var/NEWAdmin
sudo dscl . -passwd /Users/NEWAdmin ***************NEWAdminPWDCleartext********************

#Creates home folder
sudo mkdir /var/NEWAdmin
sudo chown -R NEWAdmin /var/NEWAdmin

#Makes 'NEWAdmin' a local admin
sudo dscl . -append /Groups/admin GroupMembership NEWAdmin

#Hide user
sudo defaults write /Library/Preferences/com.apple.loginwindow Hide500Users -bool YES

#Gives SSH access to 'NEWAdmin'
sudo /usr/sbin/dseditgroup -o create -q com.apple.access_ssh

sudo /usr/sbin/dseditgroup -o edit -a NEWAdmin -t user com.apple.access_ssh

#Enabling SSH:
#sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist
sudo launchctl list | grep ssh  >/dev/null && echo "Process SSH found" || echo "Process SSH not found Enabling SSH" && sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist


#Disabling SSH:
#sudo launchctl list | grep ssh  >/dev/null && echo "Process SSH found" && sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist || echo "Process SSH not found Enabling SSH"
