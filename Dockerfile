# NGINX als Base Image
FROM nginx:1.19

# Kopiere die Artefakte in den html Ordner
COPY ./build/web /usr/share/nginx/html

# jq zum Generieren der config.json Datei installieren
RUN apt-get update
RUN apt-get install --no-install-recommends --no-install-suggests -y jq

# Shell Skript zum Generieren der Config ins Root Verzeichnis kopieren
COPY generate_config.sh /

# Das Shell Skript als Entrypoint setzen um sicherzugehen, dass es beim Starten generiert wird
EXPOSE 80
ENTRYPOINT [ "/generate_config.sh" ]

# NGINX starten
CMD ["nginx", "-g", "daemon off;"]
