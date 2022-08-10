#! /usr/bin/env bash
ARCHIVO=$1
# Se cuenta la cantidad de palabras con wc y se pasa por pipe a grep para que tome la primera parte del resultado y se guarde en una variable.
CANTIDADPALABRAS=$(wc -w $ARCHIVO | grep -o "^[0-9]*")
# Se verifica si la variable tiene un valor mayor a 0 caso contrario se muestra un mensaje por salida estandar.
if [ $CANTIDADPALABRAS -gt 0 ]
then
    # Se filta con grep las palabras luego se pasan como entrada a awk que calcua su longitud, con cut se deja la primer columna(osea los números),
    # se ordena con sort y se guardan en un archivo temporal
    grep -E -o "\<[A-Za-z]+\>" $ARCHIVO | awk '{ print length, $0 }' | cut -d " " -f1 | sort -n > /tmp/temporal
    # asignamos un  mínimo y un máximo con el head y tail
    MINIMO=$(head -1 /tmp/temporal)
    MAXIMO=$(tail -1 /tmp/temporal)
    # Al archivo le eliminamos los espacios con tr y se lo guarda cen un archivo temporal llamado sin-espacios.
    tr -d '([:space:]' <$ARCHIVO> /tmp/sin-espacios
    # Eliminamos cualquier caracter que no sea una letra o número del español.
    sed -i 's/[^A-Za-z0-9]//g' /tmp/sin-espacios
    # Calculamos la cantidad de carácteres y lo guarda en una variable CANTIDADCARACTERES.
    CANTIDADCARACTERES=$(wc -c /tmp/sin-espacios | grep -o "^[0-9]*")
    # Se calcula el promedio usando bc con libreria matematica -l, seteando con scale=2 para que tome y redondee con dos decimales.
    # Guardamos el resultado en una variable PROMEDIO
    PROMEDIO=$(echo "scale=2; $CANTIDADCARACTERES / $CANTIDADPALABRAS" | bc -l)
    #Imprimimos por pantalla los resultados obtenidos.
    echo "la palabra con más larga tiene $MAXIMO caracteres."
    echo "la palabra con más corta tiene $MINIMO caracteres."
    echo "El promedio es $PROMEDIO caracteres por palabra."
    # Se eliminan los archivos temporales y las variables usadas
    unset MAXIMO MINIMO CANTIDADPALABRAS CANTIDADCARACTERES PROMEDIO
    rm /tmp/temporal /tmp/sin-espacios
else
    echo "No hay palabras en el archivo de texto."
    unset CANTIDADPALABRAS
fi
