#!/bin/bash
# Datenschmutz Auto-Backup
# On Every reboot, selected files will be automatically backuped into timestamped folders.

###############
## EDIT ZONE ##
###############

#Replace "pi" if you have a different user. "pi" is standard in most installations.
USERNAME="pi" 

# you should understand how to enable and disable it manually...

#Klipper Config (default on)
CONFIG="yes"

#Replace "pi" if you have a different user. "pi" is standard in most installations.
RCLONE='fillme'

#Klipper
KLIPPER='no'

#Moonraker History
HISTORY='no'

#Extras (ERCF Scripts, etc. )
EXTRAS='no'

#LOGS
LOGS='no'

#Moonraker and Env
MOONRAKER='no'

#G-Code Files. Warning: Will take up a lot of space over time
GCODES='no'

###############
## DON'T EDIT ZONE ##
###############


CURRENTDATE=$(date)
BCKUPPATH=/home/$USER/autobackup

if [ $CONFIG = "yes" ]
then
  cp -r /home/$USERNAME/klipper_config "$BCKUPPATH"
fi


if [ $KLIPPER = "yes"  ]
then
  cp -r /home/$USERNAME/klipper "$BCKUPPATH"
fi

if [ $EXTRAS = "yes" ]
then
  cp -r /home/$USERNAME/klipper/klippy/extas "$BCKUPPATH"
fi

if [ $LOGS = "yes" ]
then
  cp -r /home/$USERNAME/klipper_logs "$BCKUPPATH"

fi

if [ $MOONRAKER = "yes" ]
then
  cp -r /home/$USERNAME/moon* "$BCKUPPATH"

fi

if [ $GCODES = "yes" ]
then
  cp -r /home/$USERNAME/gcode_files "$BCKUPPATH"

fi

if [ $HISTORY = "yes" ]
then
  cp -r /home/$USERNAME/.moonraker_database "$BCKUPPATH"

fi

cd "$BCKUPPATH" && tar -cvzf Voron-Backup-$(date +%d.%m.%Y).tar.gz --directory="$BCKUPPATH" .

/usr/bin/rclone move -P --update --verbose --transfers 30 --log-file=/var/log/upload.log "$BCKUPPATH" "s3-eu2:backup/"

###############################
## CUSTOM BACKUP FOLDER ZONE ##
###############################

#Example: sudo cp -r /YOUR/FOLDER "$BCKUPPATH"









#Remixed by Datenschmutz based on Takuya Script ;)
