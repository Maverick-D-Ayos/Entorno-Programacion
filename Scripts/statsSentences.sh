#! /usr/bin/env bash
ARCHIVO=$1
TEMPORAL=/tmp/temporal
# Primero cambia ", ¿¡" por " ", se elimina "?!,", si hay un . y mayúscula se hace una nueva línea, se elimina ?!, 
# luego si hay oraciones que empiezan con ¿¡ se crea una nueva línea.
sed -e 's/, [¿¡]/ /g' -e 's/[?\!],//g' -e 's/\. [A-Z0-9]/\n\U&/g' -e 's/[ \.][¿¡][^a-z]/\n\U&/g' <$ARCHIVO> $TEMPORAL
# Se eliminan puntuaciones y otros caracteres, si hay oraciones detras de ?! se hace nueva línea y lo mismo con las oraciones comunes.
sed -i -e 's/[",:;#\$\&\*]//g' -e 's/[?¡][ \.][^a-z]/\n\U&/g' -e 's/\. [A-Z0-9]/\n\U&/g' $TEMPORAL
# Se elimina ?!. del inicio de cada línea, " " y ¿¡, restos de ¿?¿!.
sed -i -e 's/^[?\!\.]//g' -e 's/^ [¿¡]//g' -e 's/[¿?¡\!\.]//g' $TEMPORAL
# Se guarda en variable la cantidad de palabrasa por oracion usando grep y wc.
CANTIDADPALABRAS=$(grep -E -o "[A-Z0-9][^.]*" $TEMPORAL | wc -w)
# Se guarda en variable la cantidad de oraciones. Se utiliza grep para filtrar las oraciones y se cuenta con wc.
CANTIDADORACIONES=$(grep -E -o "[A-Z0-9][^.]*" $TEMPORAL | wc -l)
# Se calcula el promedio usando bc con libreria matematica -l, seteando con scale=2 para que tome y redondee con dos decimales.
PROMEDIO=$(echo "scale=2; $CANTIDADPALABRAS / $CANTIDADORACIONES" | bc -l)
# Se filtra con grep solo las oraciones y se guardan en un archivo temporal.
grep -o "[A-Z0-9][^.]*" $TEMPORAL >> /tmp/filtrado
# Se lee línea a línea hasta el final del archivo, se cuenta la cantidad de líneas.
while IFS= read -r line; do echo $line | wc -w; done < /tmp/filtrado >> /tmp/tmp2
#Se ordena por orden numérico y se guarda en el archivo /tmp/ordenado.
sort -n /tmp/tmp2 > /tmp/ordenado
# Se guarda por variables el primer y ultimo elemento del archivo.
MINIMO=$(head -1 /tmp/ordenado)
MAXIMO=$(tail -1 /tmp/ordenado)
# Se muestra el resultado por salida estandar.
echo "La oración con mayor longitud tiene $MAXIMO. 
La oración con menor longitud tiene $MINIMO.
El promedio es $PROMEDIO."
# Se eliminan los archivos temporales y variables.
rm /tmp/filtrado /tmp/tmp2 /tmp/ordenado /tmp/temporal
unset CANTIDADPALABRAS CANTIDADORACIONES PROMEDIO MINIMO MAXIMO TEMPORAL
