#! /usr/bin/env bash
# Se usa grep con la opción de remarcar con color las palabras que empiezan con mayúsculas.
# Se muestra el texto con las palabras que empiezan con mayúsculas resaltadas.
ARCHIVO=$1
grep --color='always' "\<[A-Z][^ ]*\>" $ARCHIVO
