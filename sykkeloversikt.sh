#!/bin/bash -e

# Check if jq is installed, if not quit
command -v jq >/dev/null 2>&1 || { echo >&2 "Required progam jq not installed run: \"sudo apt-get install jq\""; exit 1; }

STATIONS=$(curl -s https://gbfs.urbansharing.com/oslobysykkel.no/station_information.json | jq -c '.data.stations[]') 
STATUS=$(curl -s https://gbfs.urbansharing.com/oslobysykkel.no/station_status.json | jq -c '.data.stations[]')

readarray -t station_array <<< "${STATIONS}"
