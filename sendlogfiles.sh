#!/bin/bash
#Send logs to IT admin

#Who shoud get this message
vReciver="add email here"
# Folder to look for latest logfile. 
vLogFile="`sudo ls -Art /Library/Logs/Microsoft/Intune/ | tail -n 1`"


#Action sends the file file 
action="`(uuencode "/Library/Logs/Microsoft/Intune/$vLogFile" logfile.log) | mail -s "my computers logfile " $vReciver`"
