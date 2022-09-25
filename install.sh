ECHO ________          __                              .__                    __                                           
ECHO \______ \ _____ _/  |_  ____   ____   ______ ____ |  |__   _____  __ ___/  |_________                                 
ECHO  |    |  \\__  \\   __\/ __ \ /    \ /  ___// ___\|  |  \ /     \|  |  \   __\___   /                                 
ECHO  |    `   \/ __ \|  | \  ___/|   |  \\___ \\  \___|   Y  \  Y Y  \  |  /|  |  /    /                                  
ECHO /_______  (____  /__|  \___  >___|  /____  >\___  >___|  /__|_|  /____/ |__| /_____ \                                 
ECHO        \/     \/          \/     \/     \/     \/     \/      \/                  \/                                 
ECHO ____   ____                                     _____          __        __________                __                 
ECHO \   \ /   /__________  ____   ____             /  _  \  __ ___/  |_  ____\______   \_____    ____ |  | ____ ________  
ECHO  \   Y   /  _ \_  __ \/  _ \ /    \   ______  /  /_\  \|  |  \   __\/  _ \|    |  _/\__  \ _/ ___\|  |/ /  |  \____ \ 
ECHO   \     (  <_> )  | \(  <_> )   |  \ /_____/ /    |    \  |  /|  | (  <_> )    |   \ / __ \\  \___|    <|  |  /  |_> >
ECHO    \___/ \____/|__|   \____/|___|  /         \____|__  /____/ |__|  \____/|______  /(____  /\___  >__|_ \____/|   __/ 
ECHO                                  \/                  \/                          \/      \/     \/     \/     |__|    
ECHO "Based on Takuyas Script"
cd /home/$USER/ 
sudo wget https://raw.githubusercontent.com/Datenschmutz/VORON/main/backup.sh
sudo chmod +x /home/$USER/backup.sh

mkdir /home/$USER/autobackup

apt-get install rclone
rclone config

echo "sudo bash /home/$USER/backup.sh" | sudo tee -a /etc/rc.local
clear

read -p "rclone Job Name:" rclone
read -p "Enable Klipper Backup? (yes/no): " klipp
read -p "Enable Moonraker History (print stats)? (yes/no): " hist
read -p "Enable Extras Backup (.py Scripts/ Ercf...) (yes/no): " extr
read -p "Enable Log Backup (yes/no): " log
read -p "Enable Moonraker Backup (yes/no): " moonrake
read -p "Enable G-Code File Backup. Warning: Will take up more space over time (yes/no): " gcod

sed -i "s/RCLONE='fillme' /RCLONE='$rclone'/"/home/$USER/backup.sh
sed -i "s/KLIPPER='no'/KLIPPER='$klipp'/" /home/$USER/backup.sh
sed -i "s/HISTORY='no'/HISTORY='$hist'/" /home/$USER/backup.sh
sed -i "s/EXTRAS='no'/EXTRAS='$extr'/" /home/$USER/backup.sh
sed -i "s/LOGS='no'/LOGS='$log'/" /home/$USER/backup.sh
sed -i "s/MOONRAKER='no'/MOONRAKER='$moonrake'/" /home/$USER/backup.sh
sed -i "s/GCODE='no'/GCODE='$gcod'/" /home/$USER/backup.sh


echo "####################################"
echo "## Thank you for using my script, ##"
echo "####################################"
