
# Palworld Dedicated Linux Server Auto Reboot Settings

Simple settings for an Ubuntu Server with 32gb of RAM. I use this to automate server restarts using ARRCON for a safer shutdown rather than opting for a power cycle. 

There are other RCON tools, but you can't do much in palworld anyways, so keep things real simple.

RAM usage gets pretty high (18-20gb) even with 3-4 players, so a safe restart is not a terrible idea.

## Prerequisites
- Setup Server https://pimylifeup.com/ubuntu-palworld-dedicated-server/
- ARRCON Setup https://github.com/radj307/ARRCON

## ARRCON Setup Reference
Install is super simple, you just need to unpack ARRCON into your directory of choice and it should be ready to use. 

I chucked this into `/home/steam/arrcon`

Version 3.3.7 was the latest version at the time of this writing. You can always opt for a [different version under releases](https://github.com/radj307/ARRCON/releases). 

### First timers
```
wget "https://github.com/radj307/ARRCON/releases/download/3.3.7/ARRCON-3.3.7-Linux.zip"
unzip -o ARRCON-3.3.7.zip
```

# Piecing it all together
1. Make sure all [prequisites](#Prerequisites) have been completed 
2. In your PalWorldSettings.ini, make sure you set `RCONEnabled=true` and remember to set the port to something not used and dont use the default.
3. Place the 2 scripts in your /home/steam directory
4. You'll need to modify the crontab as root, and copy and update the schedule on what you would prefer. 
5. To modify crontab type in the following. `sudo crontab -e`
6. You should be good to go now. If things aren't running, you may have forgotten to make the scripts executable. e.g `chmod +x palworld_restart.sh` 

### cronjob note
The server is currently is to do the following:

- A backup every hour at the 10 minute mark

- Restarts the server twice a day at 2AM and 2PM


# Acknowledgements

 - [Backup Script](https://gist.github.com/Insax/37617020076cfad912222f57d3cc270a#file-backupscript-sh)
 - [Transferring Server Files](https://www.gamenguides.com/how-to-backup-and-transfer-palworld-dedicated-server-to-a-new-server)

