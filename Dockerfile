
FROM ubuntu:22.04 

#Healthcheck
RUN apt-get update && apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*


RUN useradd -m nabila
USER nabila

COPY --chown=nabila:nabila index.html /var/www/html/

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
