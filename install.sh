#!/bin/bash

echo "#############################"
echo Datenschmutz Auto Backup install
echo "#############################"

cd /home/$USER/ 
sudo wget https://raw.githubusercontent.com/Datenschmutz/VORON/main/backup-script/backup.sh
sudo chmod +x /home/$USER/backup.sh

mkdir /home/$USER/autobackup

sudo apt-get install rclone

clear
echo rClone Install - view README.md in Github

rclone config

echo "sudo bash /home/$USER/backup.sh" | sudo tee -a /etc/rc.local
clear

read -p "rclone destination Name:" rclone
read -p "Enable Klipper Backup? (yes/no): " klipp
read -p "Enable Moonraker History (print stats)? (yes/no): " hist
read -p "Enable Extras Backup (.py Scripts/ Ercf...) (yes/no): " extr
read -p "Enable Log Backup (yes/no): " log
read -p "Enable Moonraker Backup (yes/no): " moonrake
read -p "Enable G-Code File Backup. Warning: Will take up more space over time (yes/no): " gcod

sed -i "s/RCLONE='fillme'/RCLONE='$rclone'/" /home/$USER/backup.sh
sed -i "s/KLIPPER='no'/KLIPPER='$klipp'/" /home/$USER/backup.sh
sed -i "s/HISTORY='no'/HISTORY='$hist'/" /home/$USER/backup.sh
sed -i "s/EXTRAS='no'/EXTRAS='$extr'/" /home/$USER/backup.sh
sed -i "s/LOGS='no'/LOGS='$log'/" /home/$USER/backup.sh
sed -i "s/MOONRAKER='no'/MOONRAKER='$moonrake'/" /home/$USER/backup.sh
sed -i "s/GCODE='no'/GCODE='$gcod'/" /home/$USER/backup.sh


echo "####################################"
echo "## Thank you for using my script, ##"
echo "####################################"
echo "Thanks to @T4KUUY4 for the foundation of this script"