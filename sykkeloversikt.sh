#!/bin/bash -e

# Check if jq is installed, if not quit
command -v jq >/dev/null 2>&1 || { echo >&2 "Required progam jq not installed run: \"sudo apt-get install jq\""; exit 1; }

STATIONS=$(curl -s https://gbfs.urbansharing.com/oslobysykkel.no/station_information.json | jq -c '.data.stations[]') 
STATUS=$(curl -s https://gbfs.urbansharing.com/oslobysykkel.no/station_status.json | jq -c '.data.stations[]')

readarray -t station_array <<< "${STATIONS}"

for station in "${station_array[@]}"; do
  station_id=$(jq '. | .station_id' <<< "${station}")
  station_name=$(jq '. | .name' <<< "${station}")
  station_status=$(jq -c ". | select(.station_id==${station_id})" <<< "${STATUS}")
  bikes=$(jq '. | .num_bikes_available' <<< "${station_status}")
  docks=$(jq '. | .num_docks_available' <<< "${station_status}")

  result=${result}"{\"name\": $station_name, \"bikes\": $bikes, \"docks\": $docks},"
done
jq . <<< [${result%?}]
