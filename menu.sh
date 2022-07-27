#! /usr/bin/env bash
submenu(){
TEXTO=$1
echo -ne "
1) Contador de palabras        4) Contador de oraciones
2) Contador uso de palabras    5) Contador de lineas en blanco
3) Identificador de nombres    0) Volver al menú principal
C) Limpiar pantalla
Eliga una opción: "
read opcion
case $opcion in
        1) ./Scripts/statsWords.sh $TEXTO ; submenu $TEXTO ;;
        2) ./Scripts/statsUsageWords.sh $TEXTO ; submenu $TEXTO;;
        3) ./Scripts/findNames.sh $TEXTO ; submenu $TEXTO;;
        4) ./Scripts/statsSentences.sh $TEXTO ; submenu $TEXTO;;
        5) ./Scripts/blankLinesCounter.sh $TEXTO ; submenu $TEXTO;;
        0) clear ; menu ;;
        C) clear ; submenu $TEXTO;;
        *) echo -e "Opcion incorrecta $opcion" ; submenu $TEXTO;;
esac
}

menu(){
echo "Seleccione un TEXTO de texto por favor."
ls /texto/
read
if [ -r /texto/$REPLY ] && [ -f /texto/$REPLY ]
then
    submenu /texto/$REPLY
else
    echo "No es un archivo de texto simple, no tiene permisos de lectura o no existe."
fi
}

menu
