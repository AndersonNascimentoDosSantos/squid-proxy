# Imagem base para o Traefik
FROM traefik:latest AS traefik

# Copiar os arquivos de configuração do Traefik
COPY ./data/traefik.yml /traefik.yml
COPY ./data/acme.json /acme.json
COPY ./data/configurations /configurations

# Imagem base para o Squid
FROM ubuntu/squid AS squid

# Copiar os arquivos de configuração do Squid
COPY ./squid.conf /etc/squid/squid.conf
COPY ./passwords /etc/squid/passwords

# Definir as portas para o Traefik e Squid
EXPOSE 80 443 3128

# Comando para iniciar o Traefik
CMD ["traefik", "--configFile=/traefik.yml"]