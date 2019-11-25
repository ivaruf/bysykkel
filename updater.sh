#!/bin/bash -e

V_1=api/bysykkel/v1/
V_2=api/bysykkel/v2/

# Make sure paths exsists
mkdir -p "${V_1}"
mkdir -p "${V_2}"

echo "Updating data for api Press [CTRL+C] to stop."

while :
do
  printf "Data is updating ..."
  ./sykkeloversikt.sh > /dev/null 2>&1
  mv v1_out.json ${V_1}/oversikt.json
  mv v2_out.json ${V_2}/oversikt.json
  printf " Done: "
  date
  sleep 10
done

