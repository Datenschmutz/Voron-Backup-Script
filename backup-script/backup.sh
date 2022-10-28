#!/bin/bash
BIRed='\033[1;91m'
clear='\033[0m'
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

#Replace with the name of your rClone destination
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

#Config check
if [ $CONFIG = "yes" ] || [ $CONFIG = "no" ]
then
  :
else
  echo -e ${BIRed}Klipper config argument can only be yes/no please correct "CONFIG=" in backup.sh${clear}. && exit
fi

if [ $RCLONE = "fillme"  ]
then
echo -e ${BIRed}rClone config argument is at default value please configure "backup.sh" via the "install.sh" script{clear}. && exit
fi

if [ $KLIPPER = "yes" ] || [ $KLIPPER = "no" ]
then
  :
else
  echo -e ${BIRed}Klipper config argument can only be yes/no please correct "KLIPPER=" in backup.sh${clear}. && exit
fi

if [ $EXTRAS = "yes" ] || [ $EXTRAS = "no" ]
then
  :
else
  echo -e ${BIRed}Extras Backup -.py Scripts/ Ercf...- config argument can only be yes/no please correct "EXTRAS=" in backup.sh${clear}. && exit
fi

if [ $LOGS = "yes" ] || [ $LOGS = "no" ]
then
  :
else
  echo -e ${BIRed}Logs config argument can only be yes/no please correct "LOGS=" in backup.sh${clear}. && exit
fi

if [ $MOONRAKER = "yes" ] || [ $MOONRAKER = "no" ]
then
  :
else
  echo -e ${BIRed}Moonraker config argument can only be yes/no please correct "MOONRAKER=" in backup.sh${clear}. && exit
fi

if [ $GCODES = "yes" ] || [ $GCODES = "no" ]
then
  :
else
  echo -e ${BIRed}GCodes config argument can only be yes/no please correct "GCODES=" in backup.sh${clear}. && exit
fi

if [ $HISTORY = "yes" ] || [ $HISTORY = "no" ]
then
  :
else
  echo -e ${BIRed}History config argument can only be yes/no please correct "HISTORY=" in backup.sh${clear}. && exit
fi

#Copy selected files/folders
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

#Compresses copied files into a tar.gz archive
cd "$BCKUPPATH" && tar -cvzf Voron-Backup-$(date +%d.%m.%Y).tar.gz --directory="$BCKUPPATH" .

#rClone command to move tar.gz archive to S3 destination directory
/usr/bin/rclone move -P --update --verbose --transfers 30 --log-file=/var/log/upload.log "$BCKUPPATH" "s3-eu2:backup/"

###############################
## CUSTOM BACKUP FOLDER ZONE ##
###############################

#Example: sudo cp -r /YOUR/FOLDER "$BCKUPPATH"









#Remixed by Datenschmutz based on Takuya Script ;)
