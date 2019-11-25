# Enkel bysykkel-oversikt

Et lite script som henter ut navn, tilgjengelige sykler og låser for bysykkelstasjoner i Oslo.
Bruker Oslo Bysykkel sanntids-api: https://oslobysykkel.no/apne-data/sanntid

Krever:
* bash 4.2 eller nyere
* jq `sudo apt-get install jq`

Kjøres med:

`./sykkeloversikt.sh`

Kjør tester med:

`./tests.sh`


Output av JSON:
Json med "name" (stasjon-navn), "bikes" (tilgjenglige sykkler), og "docks" (tilgjenglige låser) for alle stasjoner



## Eksponer endepunkt

Kjør updater script, dette sørger for at data er oppdatert

`./updater.sh`

Gå inn i api mappen

`cd api`

Serve innholdet på valgfritt vis, under følger tre eksempler:

Python 2:

`python -m SimpleHTTPServer 8000`

Python 3:

`python -m http.server 8000`

Node server:

`npm install -g serve`

`serve -l 8000`

Endepunkt vil nå bli å finne på
* http://localhost:8000/bysykkel/v1/oversikt.json
* http://localhost:8000/bysykkel/v2/oversikt.json

NB:
Ikke optimalisert for hastighet eller effektivitet, kun et artig lite eksempel som var mulig å kode i bash =)
