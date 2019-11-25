#!/bin/bash -e

RESULT=TEST_oversikt.json
EXPECTED_STATIONS=244
FAILED=false

# Colors
red='\033[0;31m'
green='\033[0;32m'
colorless='\033[0m'

# Color print functions
function print_green() {
  printf "${green}${1}${colorless}\n"
}
function print_red() {
  printf "${red}${1}${colorless}\n"
}

function check_station() {
  station=$1
  if [ $(grep "${1}" ${RESULT} | wc -l) == 1  ]; then
    print_green "Station: \"$1\" found, (test ok)"
  else
    print_red "Station: \"$1\" not found, (test failed)"
    FAILED=true
  fi
}

print_green "Fetching data ... \n"

./sykkeloversikt.sh > ${RESULT}

check_station Sommerfrydhagen
check_station "Frogner Stadion"
check_station Stortingstunellen

LENGTH=$(jq length ${RESULT})

if [ ${LENGTH} -ge ${EXPECTED_STATIONS} ]; then
  print_green "Found ${LENGTH} stations, expected at least ${EXPECTED_STATIONS}, (test ok) \n"
else
  print_red "Found ${LENGTH} stations, expected at least ${EXPECTED_STATIONS} staions, (test failed) \n"
  FAILED=true
fi

if $FAILED; then
  print_red "Tests failed."
else
 print_green "Tests ran with no problems!"
fi

# Clean up
rm ${RESULT}
