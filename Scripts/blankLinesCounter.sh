#! /usr/bin/env bash
# Se lee el archivo de texto con grep usando los parametros -c (cuenta las líneas),
# y usando el patron ^[[:space:]]$ en el cual se le indica que comience y termine la línea
# con espacios, tabulaciones, etc.
# Luego se muestra la cantidad de líneas en blanco que tiene el archivo de texto por salida estándar.
ARCHIVO=$1
CONTADOR=$(grep -c "^[[:space:]]*$" $ARCHIVO)
echo "La cantidad de líneas en blanco es $CONTADOR."
unset CONTADOR
