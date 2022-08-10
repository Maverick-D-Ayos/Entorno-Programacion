FROM ubuntu
MAINTAINER Juan Pablo Ayala "lozziajuan@gmail.com"
# Se descarga las aplicaciones usadas por el scripts que no estan disponibles en la imagen oficial.
RUN apt-get update && apt-get install -y gawk bc locales && apt-get clean && rm -rf /var/lib/apt/lists/*
# Se configura el idioma al español argentino UTF-8.
RUN locale-gen es_AR.UTF-8  

ENV LANG es_AR.UTF-8
ENV LANGUAGE es_AR:es  
ENV LC_ALL es_AR.UTF-8  

# Se copia los scripts y el menú.
COPY menu.sh .
COPY Scripts /Scripts

# Cuando se inicia el container se ejecuta el menú.
ENTRYPOINT ["/bin/bash", "/menu.sh"]
