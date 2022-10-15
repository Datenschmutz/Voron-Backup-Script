# Auto-Backup your printer config files with rClone to S3.

## Disclaimer
WORK IN PROGRESS. **BACKUP YOUR FILES MANUALLY!!!!**
I´m not responsible for any not functioning printers or lost files!

## Requirements 
 * S3 Storage
 * Basic knowlage of rClone		

## Installation

```
wget https://raw.githubusercontent.com/Datenschmutz/VORON/main/backup-script/install.sh
```
    bash install.sh

## Configuration
* The backup script has some additional configuration options. Open it with `sudo nano /home/$USER/backup.sh`
```
sudo nano /home/$USER/backup.sh
```
*  Follow the instructions given in the script

### rClone Setup for S3 Storage
>I use the Contabo S3 storage based on Cleph for my tutorial, the configuration may differ for other providers.[^1]
* Press `n` for new remote storage
* Specify a rClone Destination *name*, e.g. `MyS3-Storage`
* Press `4` for *Amazon S3 Compliant Storage Providers including AWS, Alibaba, Ceph, Digital Ocean, Dreamhost, IBM COS, Minio, SeaweedFS, and Tencent COS*
* Select the S3 storage solution e.g. `3` *for Ceph Object Storage*
* Press `1` for Enter AWS credentials in the next step.
* Specify your `access_key`, *e.g. 82046e8110804a43bf29c1ae426a724d* for *access_key_id*
* Specify your `secret_key`, *e.g. 82e69bd7a52076c527154297a76c2233* for *secret_access_key*
* Press `return` to skip *region*
* Specifiy the S3 URL, e.g. https://eu2.contabostorage.com for *endpoint*
* Press `return` to skip *location_constraint*
* Press `return` to skip *acl*
* Press `return` to skip *server_side_encryption*
* Press `return` to skip *sse_kms_key_id*
* Press `n` for *Edit advanced config*
* Press `y` for *Yes this is OK (default)*
* Optionally specify `q` to *quit configuration mode*

 
## Want a Mainsail/Fluidd Backup Macro?
**Requires G-Gcode Shell Command Extension (install with KIAUH)**
* Download the backup.cfg and include it in your printer.cfg

## Mentions, Credits and Sources
* Thanks to @T4KUUY4 for the foundation of this script - https://github.com/T4KUUY4/Voron-Stuff/tree/main/Automatic%20Backup

[^1]: Variation of the rCLone setup manual from Contabo - https://docs.contabo.com/docs/products/Object-Storage/Tools/rclone
