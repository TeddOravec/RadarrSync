#!/bin/ash

# Create /Config.txt based on the environment variables we were passed,
#   Only if there is not already a file at the locations.
#   Else, create template configs for reference.

if test -f "/config/Sonarr.txt"; then
	SONARR="/config/sonarr-template.txt"
	echo "Sonarr.txt detected! Use sonarr-template to ensure you have everything you need in your file."
else
	SONARR="/config/Sonarr.txt"
	echo "Sonarr.txt not found! Creating a new file using your ENV variables (if you provided them)"
fi
touch $SONARR

echo "[General]
# Time to wait between adding new series to a server. This will help reduce the load of the Sync server. 0 to disable. (seconds)
wait_between_add = 5

# Full path to log file
log_path = ./SonarrOutput.txt

# DEBUG, INFO, VERBOSE | Logging level.
log_level = DEBUG

[SonarrMaster]
url = $SOURCE_SONARR_URL
key = $SOURCE_SONARR_KEY

[SyncServers]
# Ensure the servers start with 'Sonarr_'
[Sonarr_4k]
url = $DEST_SONARR_URL
key = $DEST_SONARR_KEY

# Only sync series that are in these root folders. ';' (semicolon) separated list. Remove line to disable.
rootFolders = $SONARR_ROOT_PATH

# If this path exists
current_path = $SOURCE_SONARR_PATH
# Replace with this path
new_path = $DEST_SONARR_PATH

# This is the profile ID the series will be added to.
profileId = $SOURCE_SONARR_PROFILE_NUM

# This is the profile ID the series must have on the Master server.
profileIdMatch = $DEST_SONARR_PROFILE_NUM
" > $SONARR

if test -f "/config/Radarr.txt"; then
	RADARR="/config/radarr-template.txt"
	echo "Radarr.txt detected! Use radarr-template to ensure you have everything you need in your file."
else
	RADARR="/config/Radarr.txt"
	echo "Radarr.txt not found! Creating a new file using your ENV variables (if you provided them)"
fi
touch $RADARR

echo "
[Radarr]
url = $SOURCE_RADARR_URL
key = $SOURCE_RADARR_KEY
path = $SOURCE_RADARR_PATH

[Radarr-target]
url = $DEST_RADARR_URL
key = $DEST_RADARR_KEY
path_from = $SOURCE_RADARR_PATH
path_to = $DEST_RADARR_PATH
# Sync movies coming _from_ the source in this quality profile
profile = $SOURCE_RADARR_PROFILE_NUM
# When adding movise to the destination Radarr, use _this_ quality profile (may differ from source)
target_profile = $DEST_RADARR_PROFILE_NUM
"  > $RADARR


if [ -z ${DELAY+x} ] ; then
	DELAY=15m
fi

# Now execute the sync script in a loop, waiting DELAY before running again
while true
do
	python /arrsync/RadarrSync.py 
	python /arrsync/SonarrSync.py
	sleep $DELAY
done
