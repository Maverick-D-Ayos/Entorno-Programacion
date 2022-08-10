#! /usr/bin/env bash
# Se usa grep con la opción de remarcar con color las palabras que empiezan con mayuscúlas.
# Se muestra el texto con las palabras en mayusculas resaltadas.
ARCHIVO=$1
grep --color='always' "\<[A-Z][^ ]*\>" $ARCHIVO
