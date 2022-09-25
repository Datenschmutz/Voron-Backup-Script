# Auto-Backup your printer config files with rClone to S3.

## Disclaimer
WORK IN PROGRESS. **BACKUP YOUR FILES MANUALLY!!!!**
I´m not responsible for any not functioning printers or lost files!

## Requirements 
 * S3 Storage
 * Basic knowlage of rClone
 
 * Windows: 
	* Create a new user for the shared folder
	* Example Username=**Printer**, Password=**Backup**
	* Open  **File Explorer**  and browse to the folder you want to share.
	* Right-click it and select  **Properties**.
	* Select the **Sharing** tab **> Share.**
	* Within the  **Network access**  window, select the new user you just created.
	* Click  **Add > Share**.
	* Copy the network path.
	* Click  **Done**.
			

## Installation

    wget https://raw.githubusercontent.com/T4KUUY4/Voron-Stuff/main/Automatic%20Backup/install.sh

    bash install.sh

# rClone Setup
    specify n for n) New remote
    specify a name, e.g. eu2
    specify 4 for Amazon S3 Compliant Storage Providers including AWS, Alibaba, Ceph, Digital Ocean, Dreamhost, IBM COS, Minio, SeaweedFS, and Tencent COS
    specify 3 for Ceph Object Storage
    speficy 1 for Enter AWS credentials in the next step.
    specify your access_key, e.g. 82046e8110804a43bf29c1ae426a724d for access_key_id
    specify your secret_key, e.g. 82e69bd7a52076c527154297a76c2233 for secret_access_key
    press return to skip region
    specifiy the S3 URL, e.g. https://eu2.contabostorage.com for endpoint
    press return to skip location_constraint
    press return to skil acl
    press return to skip server_side_encryption
    press return to skip sse_kms_key_id
    specify n for Edit advanced config
    specify y for Yes this is OK (default)
    optionally specify q to quit configuration mode
## Configuration
* The backup script has some additional configuration options. Open it with `sudo nano /home/$USER/backup.sh`
*  Follow the instructions given in the script
* You can also include any other folder if you feel the need. 
* The Syntax is: `sudo cp -r /YOUR/FOLDER/ "$MNTPATH"`
 
## Want a Mainsail/Fluidd Backup Macro?
**Requires G-Gcode Shell Command Extension (install with KIAUH)**
* Download the backup.cfg and include it in your printer.cfg

