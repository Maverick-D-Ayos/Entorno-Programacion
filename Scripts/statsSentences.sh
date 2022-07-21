#! /usr/bin/env bash
ARCHIVO=$1
TEMPORAL=/tmp/temporal
sed -e 's/, [¿¡]/ /g' -e 's/[?\!],//g' <$ARCHIVO> $TEMPORAL
sed -i 's/\. [A-Z0-9]/\n\U&/g' $TEMPORAL
sed -i 's/[?\!],//g' $TEMPORAL
sed -i 's/[ \.][¿¡][^a-z]/\n\U&/g' $TEMPORAL
sed -i 's/[",:;]//g' $TEMPORAL
sed -i 's/[?¡][ \.][^a-z]/\n\U&/g' $TEMPORAL
sed -i 's/\. [A-Z0-9]/\n\U&/g' $TEMPORAL
sed -i -e 's/^[?\!\.]//g' -e 's/^ [¿¡]//g' -e 's/[¿?¡\!\.]//g' $TEMPORAL
sed -i 's/^[[:space:]]//g' $TEMPORAL
sed -i '/^$/d' $TEMPORAL
sed -i 's/$/\./g' $TEMPORAL
CANTIDADPALABRAS=$(grep -E -o "[A-Z0-9][^.]*" $TEMPORAL | wc -w) #cuenta las palabras en la oracion
CANTIDADORACIONES=$(grep -E -o "[A-Z0-9][^.]*" $TEMPORAL | wc -l) #cuenta la cantidad de oraciones
PROMEDIO=$(echo "scale=2; $CANTIDADPALABRAS / $CANTIDADORACIONES" | bc -l) #Promedio de las oraciones
grep -o "[A-Z0-9][^.]*" $TEMPORAL >> /tmp/TEXTO
while IFS= read -r line; do echo $line | wc -w; done < /tmp/TEXTO >> /tmp/alos
sort -n /tmp/alos > /tmp/ordenado
MINIMO=$(head -1 /tmp/ordenado)
MAXIMO=$(tail -1 /tmp/ordenado)
echo "la oración con mayor longitud tiene $MAXIMO."
echo "la oración con menor longitud tiene $MINIMO."
echo "El promedio es $PROMEDIO."
rm /tmp/TEXTO /tmp/alos /tmp/ordenado /tmp/temporal
unset CANTIDADPALABRAS CANTIDADORACIONES PROMEDIO MINIMO MAXIMO TEMPORAL
