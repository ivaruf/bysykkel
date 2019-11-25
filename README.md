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

Output:
Json med "name" (stasjon-navn), "bikes" (tilgjenglige sykkler), og "docks" (tilgjenglige låser) for alle stasjoner

For lagring av resultat til fil kjør:

`./sykkeloversikt.sh > oversikt.json`

NB:
Ikke optimalisert for hastighet eller effektivitet, kun et artig lite eksempel som var mulig å kode i bash =)
