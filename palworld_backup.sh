#!/bin/bash
# CREDIT TO INSAX, I pulled this backup directly from his guide. 
# https://gist.github.com/Insax/37617020076cfad912222f57d3cc270a#file-backupscript-sh
# Easy to use, just throw this in crontab and call it a day.

TARGET_FOLDER="/home/steam/Steam/steamapps/common/PalServer/Pal/Saved/SaveGames/"
BACKUP_FOLDER="/home/steam/backups"

#Create backup dir in case it does not exist
mkdir -p "$BACKUP_FOLDER"

# Hourly backups
HOUR_FILE="$BACKUP_FOLDER/hourly_$(date +\%H).tar.gz"

tar -czf "$HOUR_FILE" "$TARGET_FOLDER"

# Keep only last 5 hourly backups
ls -tpd $BACKUP_FOLDER/* | grep hourly | tail -n +6 | xargs -I {} rm -- {}

# Daily backup at 4am
if [ "$(date +\%H)" == "04" ]; then
    DAY_FILE="$BACKUP_FOLDER/daily_$(date +\%F).tar.gz"
    cp "$HOUR_FILE" "$DAY_FILE"
fi

# Weekly backup at Sunday 4am
if [ "$(date +\%u)" == "7" ] && [ "$(date +\%H)" == "04" ]; then
    WEEK_FILE="$BACKUP_FOLDER/weekly_$(date +\%Y-\%V).tar.gz"
    cp "$DAY_FILE" "$WEEK_FILE"
fi