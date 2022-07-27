#! /usr/bin/env bash
# Se lee el archivo de texto con grep usando los parametros -c (cuenta las lineas),
# y usando el patron ^[[:space:]]$ en el cual se le indica que comience y termine la linea
# con espacios, tabulaciones, \f fin de página, \n fin de línea,
# \t tabulación horizontal, \r retorno de carro, \v tabulación vertical.
# Luego se muestra la cantidad de lineas en blanco que tiene el archivo de texto
# por salida estándar.
ARCHIVO=$1
CONTADOR=$(grep -c "^[[:space:]]*$" $ARCHIVO)
echo "La cantidad de lineas en blanco es $CONTADOR."
unset CONTADOR
