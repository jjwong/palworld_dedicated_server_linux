#!/bin/bash

# You need ARRCON installed or unpackaged in the designated location for this to work.
# Make sure to set the port to a nondefault RCON port

# For first timers, make sure you remove the parenthesis
# e.g /home/steam/arrcon/ARRCON -H 127.0.0.1 -P 22222 -p mysecretpassword "broadcast SCHEDULED_REBOOT_SEQUENCE_INITIATIED"

# Warn the user
/home/steam/arrcon/ARRCON -H 127.0.0.1 -P (YOUR_PORT_NUMBER_HERE) -p (YOUR_ADMIN_PASSWORD_HERE) "broadcast SCHEDULED_REBOOT_SEQUENCE_INITIATIED"
/home/steam/arrcon/ARRCON -H 127.0.0.1 -P (YOUR_PORT_NUMBER_HERE) -p (YOUR_ADMIN_PASSWORD_HERE) "broadcast WARNING_RESTART_IMMINENT!"
sleep 3s
/home/steam/arrcon/ARRCON -H 127.0.0.1 -P (YOUR_PORT_NUMBER_HERE) -p (YOUR_ADMIN_PASSWORD_HERE) "broadcast WARNING_RESTART_IMMINENT!"
sleep 3s
/home/steam/arrcon/ARRCON -H 127.0.0.1 -P (YOUR_PORT_NUMBER_HERE) -p (YOUR_ADMIN_PASSWORD_HERE) "broadcast WARNING_RESTART_IMMINENT!"
sleep 3s

# Schedule the save and shutdown
/home/steam/arrcon/ARRCON -H 127.0.0.1 -P (YOUR_PORT_NUMBER_HERE) -p (YOUR_ADMIN_PASSWORD_HERE) "broadcast SAVING_WORLD_DATA..."
sleep 2s
/home/steam/arrcon/ARRCON -H 127.0.0.1 -P (YOUR_PORT_NUMBER_HERE) -p (YOUR_ADMIN_PASSWORD_HERE) "save"
/home/steam/arrcon/ARRCON -H 127.0.0.1 -P (YOUR_PORT_NUMBER_HERE) -p (YOUR_ADMIN_PASSWORD_HERE) "broadcast SAVE_COMPLETE."
sleep 1s
/home/steam/arrcon/ARRCON -H 127.0.0.1 -P (YOUR_PORT_NUMBER_HERE) -p (YOUR_ADMIN_PASSWORD_HERE) "broadcast SERVER_WILL_REBOOT"
sleep 1s
/home/steam/arrcon/ARRCON -H 127.0.0.1 -P (YOUR_PORT_NUMBER_HERE) -p (YOUR_ADMIN_PASSWORD_HERE) "broadcast WAIT_2_MINUTES..."
/home/steam/arrcon/ARRCON -H 127.0.0.1 -P (YOUR_PORT_NUMBER_HERE) -p (YOUR_ADMIN_PASSWORD_HERE) "shutdown 15 AUTO_SHUTDOWN_QUEUED."


# Wait for shutdown sequence to complete
sleep 30s
systemctl stop palworld
sleep 45s

# Restart the service
systemctl start palworld