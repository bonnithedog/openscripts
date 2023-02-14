#!/bin/bash

# Remove all other printers

for printer in `lpstat -p | awk '{print $2}'`
do
echo Deleting $printer
lpadmin -x $printer
done

#Adding a printer

# Name of the printer in gui
PrinterName="Canon-C5750i-v2"
# Info of the printer in gui 
printerinfo="'Your location Canon C5750i v2'"
# Location of the printer in gui
location="OSLO"
# Ip adress of the printer to add
socketip="socket://ADDYOURPRINTERSIP"
# Path for the driver
driversti="/Library/Printers/PPDs/Contents/Resources/CNMCIRAC5750S2.ppd.gz"
# Added variables so it is easier to manage settings.
vshared="false"
vjobsheets=""
vCNSrcOption="OptCas2"
vCNFinisher="STFINY1"
vCNPuncher="None"
vCNDuplex="None"
vResolution="1200"

# Crating the command to add.
addprinter="`lpadmin -p $PrinterName -E -v $socketip -P $driversti -o printer-info="$printerinfo" -o "CNSrcOption=$vCNSrcOption" -o "CNFinisher=$vCNFinisher" -o "CNPuncher=$vCNPuncher" -o printer-is-shared=$vshared -o job-sheets=$vjobsheets -o CNDuplex=$vCNDuplex -o Resolution=$vResolution -L $location`" 

# Shouting out what is doen so it will be logged in endpoint
echo Adding $printerinfo
# Adding th printer with defined settings
$addprinter

# END OF FILE
