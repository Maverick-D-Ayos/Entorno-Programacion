#! /usr/bin/env bash
ARCHIVO=$1
# Se crea un archivo con todo el texto cambiado a minúscula.
sed 's/[A-Z]/\L&/g' <$ARCHIVO> /tmp/minúsculas
# Busca todas las palabras, las ordenas, filtra las repetidas y guarda en un archivo temporal.
grep -E -o "\<[a-z]+\>" /tmp/minúsculas | sort | uniq > /tmp/temporal
#Se arma un array con los datos usando cat.
LISTA=($(cat /tmp/temporal))
#Se recorre la lista.
for cadena in "${LISTA[@]}"
do
    # Si la palabra es menor a 4 no se tomara en cuenta.
    if [ ${#cadena} -gt 3 ]
    then
        # Se va filtrando por elemento del arrray en el archivo temproal y contando la cantidad de
        # veces que aparece, luego se guarda en otro archivo poniendo la palabara y las veces que aparece.
        CANTIDAD=$(grep -E -o "\<$cadena\>" /tmp/minúsculas | wc -l) 
        echo "$CANTIDAD-$cadena" >> /tmp/repeticiones.txt
    fi
done
# Se pasa como entrada la salida de more y se lo ordena en un archivo temporal.
more /tmp/repeticiones.txt | sort -n -r >> /tmp/repeticiones
# Se muestra las diez primeras líneas del archivo.
head -10 /tmp/repeticiones
# Se eliminan las variables y los archivos temproales
rm /tmp/repeticiones /tmp/repeticiones.txt /tmp/minúsculas /tmp/temporal
unset LISTA CANTIDAD cadena
