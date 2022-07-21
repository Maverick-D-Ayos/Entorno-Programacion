FROM ubuntu
MAINTAINER Juan Pablo Ayala "lozziajuan@gmail.com"

RUN apt-get update && apt-get install -y gawk nano bc locales && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN locale-gen es_AR.UTF-8  

ENV LANG es_AR.UTF-8
ENV LANGUAGE es_AR:es  
ENV LC_ALL es_AR.UTF-8  

COPY menu.sh .
COPY Scripts /Scripts

ENTRYPOINT ["/bin/bash", "/menu.sh"]
