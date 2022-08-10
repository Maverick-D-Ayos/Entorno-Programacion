# **Universidad Nacional de Rosario - FCEIA**
## **Tecnicatura Universitaria en Inteligencia Artificial: Entorno de Programacion - Trabajo Practico Final**
### **Integrante:** Ayala Juan Pablo
### **Descripción:**
Container para el analisis de texto sencillo, son 5  scripts encargados de analizar el texto:
1. **statsWords.sh:**
Indicador estadístico de longitud de palabras (la más corta, la más larga y el promedio de longitud).
2. **statsUsageWords.sh:**
Indicador estadístico de uso de palabras, deben ser de al menos 4(cuatro) letras. (mostrar un Top Ten de estas palabras ordenadas desde la que tiene más apariciones a la que tiene menos). Es decir, filtrar las palabras que tengan al menos 4 letras y de éstas, elegir las 10 más usadas.
3. **findNames.sh:**
Identificación de nombres propios (se identifican sólo si están en este formato Nnnnnnnnn), aunque la palabra no sea un nombre propio realmente.
Ejemplos: Mateo, Estonoesunnombre, Ana.
4. **statsSentences.sh:**
Indicador estadístico de longitud de oraciones (la más corta, la más larga y el promedio de longitud).
5. **blankLinesCounter.sh:**
Contador de líneas en blanco.
### Modo de uso:
1. **Primer paso:** Tener instalado docker sino lo tiene instalado seguir el tutorial del siguiente enlace:
[Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04 "how to install and use docker on ubuntu 22.04") luego de terminar con los pasos se recomienda reiniciar el equipo.
2. **Segundo paso:** Clonar el repositorio en una carpeta por ejemplo en Descargas.
 `git clone https://github.com/Maverick-D-Ayos/Entorno-Programacion.git`
3. **Tercer paso:** Ingresar a la carpeta y abrir una terminal, ejecutar `docker build . -t tuia:tp-final`
4. **Cuarto paso:** Ejecutar `docker container run -it -v $(pwd)/texto:/texto:ro --rm tuia:final`
