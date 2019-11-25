#!/bin/bash -e

VERSION=api/bysykkel/v1/

# Make sure path exsists
mkdir -p "${VERSION}"

echo "Updating data for ${VERSION} Press [CTRL+C] to stop."

while :
do
  printf "Data is updating ..."
  ./sykkeloversikt.sh > tmp.json
  mv tmp.json ${VERSION}/oversikt.json
  printf " Done: "
  date
  sleep 10
done

