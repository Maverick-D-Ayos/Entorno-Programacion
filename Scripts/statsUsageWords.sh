#! /usr/bin/env bash
ARCHIVO=$1
sed 's/[A-Z]/\L&/g' <$ARCHIVO> /tmp/minusculas
grep -E -o "\<[a-z]+\>" /tmp/minusculas | sort | uniq > /tmp/temporal
LISTA=($(cat /tmp/temporal))
for cadena in "${LISTA[@]}"
do
    if [ ${#cadena} -gt 3 ]
    then
        CANTIDAD=$(grep -E -o "\<$cadena\>" /tmp/minusculas | wc -l) 
        echo "$CANTIDAD-$cadena" >> /tmp/repeticiones.txt
    fi
done
more /tmp/repeticiones.txt | sort -n -r >> /tmp/repeticiones
head -10 /tmp/repeticiones
rm /tmp/repeticiones /tmp/repeticiones.txt /tmp/minusculas /tmp/temporal
unset LISTA CANTIDAD cadena
